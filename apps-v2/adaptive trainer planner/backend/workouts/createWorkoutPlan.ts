type Gender = 'woman' | 'man' | 'nonbinary' | 'prefer-not'
type Condition = 'healthy' | 'returning' | 'joint-pain' | 'pregnancy-postpartum' | 'chronic-condition' | 'injury-rehab'
type Experience = 'new' | 'beginner' | 'intermediate' | 'advanced'

type PlanProfile = {
  goal: string
  currentAbility: string
  age: number
  gender: Gender
  condition: Condition
  experience: Experience
  daysPerWeek: number
  sessionMinutes: number
  timelineWeeks: number
  equipment: string[]
  injuryNotes: string
  scheduleNotes: string
}

type GoalKind = 'pull-up' | 'push-up' | 'running' | 'swimming' | 'cycling' | 'strength' | 'core' | 'mobility' | 'general'

type WgerNamed = {
  id: number
  name: string
  name_en?: string
}

type WgerTranslation = {
  name?: string
  description?: string
}

type WgerImage = {
  image?: string
  thumbnails?: {
    small?: string
    medium?: string
  }
  is_main?: boolean
}

type WgerExercise = {
  id: number
  category?: WgerNamed
  muscles?: WgerNamed[]
  muscles_secondary?: WgerNamed[]
  equipment?: WgerNamed[]
  images?: WgerImage[]
  translations?: WgerTranslation[]
  license?: {
    short_name?: string
    full_name?: string
    url?: string
  }
  license_author?: string
}

type WgerExerciseResponse = {
  count: number
  next: string | null
  previous: string | null
  results: WgerExercise[]
}

type ExerciseCard = {
  id: number
  name: string
  category: string
  muscles: string[]
  equipment: string[]
  requiredEquipment: string[]
  imageUrl: string | null
  description: string
  instructions: string[]
  commonMistakes: string[]
  modification: string
  reason: string
  source: string
}

type PlanBlock = {
  name: string
  prescription: string
  cue: string
  exercises: ExerciseCard[]
}

type WorkoutSession = {
  day: string
  focus: string
  duration: string
  blocks: PlanBlock[]
  note: string
}

type WorkoutPlan = {
  title: string
  summary: string
  goalKind: GoalKind
  timelineWeeks: number
  readinessScore: number
  apiExerciseCount: number
  sessions: WorkoutSession[]
  progression: string[]
  milestones: string[]
  adaptations: string[]
  safetyNotes: string[]
  exerciseLibrary: ExerciseCard[]
}

const categoryByGoal: Record<GoalKind, string | null> = {
  'pull-up': '12',
  'push-up': '11',
  running: '15',
  swimming: '15',
  cycling: '15',
  strength: null,
  core: '10',
  mobility: null,
  general: null,
}

function clamp(value: number, min: number, max: number) {
  if (Number.isNaN(value)) return min
  return Math.min(Math.max(value, min), max)
}

function stripHtml(html: string) {
  return html
    .replace(/<[^>]*>/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#39;/g, "'")
    .replace(/\s+/g, ' ')
    .trim()
}

function normalizeText(value: string) {
  return value.toLowerCase().replace(/[\s_-]+/g, ' ').trim()
}

function getExerciseName(exercise: WgerExercise) {
  return exercise.translations?.[0]?.name?.trim() || `Exercise ${exercise.id}`
}

function getExerciseDescription(exercise: WgerExercise) {
  const rawDescription = exercise.translations?.[0]?.description
  if (!rawDescription) return 'Description unavailable from the workout API.'
  const stripped = stripHtml(rawDescription)
  return stripped.length > 220 ? `${stripped.slice(0, 217)}...` : stripped
}

function getImageUrl(exercise: WgerExercise) {
  const mainImage = exercise.images?.find((image) => image.is_main)
  const firstImage = mainImage ?? exercise.images?.[0]
  return firstImage?.thumbnails?.medium ?? firstImage?.image ?? null
}

function muscleNames(exercise: WgerExercise) {
  return [
    ...(exercise.muscles ?? []).map((muscle) => muscle.name_en || muscle.name),
    ...(exercise.muscles_secondary ?? []).map((muscle) => muscle.name_en || muscle.name),
  ].filter(Boolean)
}

function normalizeEquipmentName(value: string) {
  const normalized = normalizeText(value)
  if (normalized.includes('pull up')) return 'Pull-up bar'
  if (normalized.includes('resistance') || normalized.includes('band')) return 'Resistance band'
  if (normalized.includes('dumbbell')) return 'Dumbbells'
  if (normalized.includes('barbell')) return 'Barbell'
  if (normalized.includes('kettlebell')) return 'Kettlebell'
  if (normalized.includes('swiss')) return 'Swiss Ball'
  if (normalized.includes('incline bench') || normalized === 'bench') return 'Bench'
  if (normalized.includes('gym') || normalized.includes('cable') || normalized.includes('machine') || normalized.includes('maschine') || normalized.includes('maquina') || normalized.includes('máquina') || normalized.includes('pulley') || normalized.includes('latzug')) return 'Gym/cable machine'
  if (normalized.includes('chair') || normalized.includes('table')) return 'Sturdy chair/table'
  if (normalized.includes('mat')) return 'Yoga mat'
  if (normalized.includes('pool') || normalized.includes('swim')) return 'Pool access'
  if (normalized.includes('bike') || normalized.includes('cycle')) return 'Bike'
  if (normalized.includes('running') || normalized.includes('shoes')) return 'Running shoes'
  return value
}

function hasEquipment(profile: PlanProfile, required: string) {
  const normalizedRequired = normalizeEquipmentName(required)
  return profile.equipment.some((item) => normalizeEquipmentName(item) === normalizedRequired)
}

function uniqueEquipment(items: string[]) {
  const normalized = new Map<string, string>()
  for (const item of items) {
    const equipment = normalizeEquipmentName(item)
    if (equipment && normalizeText(equipment) !== 'none (bodyweight exercise)') normalized.set(equipment, equipment)
  }
  return [...normalized.values()]
}

function inferRequiredEquipment(exercise: WgerExercise, kind: GoalKind) {
  const name = normalizeText(`${getExerciseName(exercise)} ${getExerciseDescription(exercise)}`)
  const apiEquipment = (exercise.equipment ?? [])
    .map((item) => item.name)
    .filter((item) => normalizeText(item) !== 'none (bodyweight exercise)')
  const inferred: string[] = []

  if (/(pull ?up|chin ?up|dominada|klimmzug|dead hang|active hang)/.test(name)) inferred.push('Pull-up bar')
  if (/(lat pull|front pull|pulldown|jalón|latzug|zugmaschine|pulley|cable|machine|maschine|maquina|máquina|seilzug)/.test(name)) inferred.push('Gym/cable machine')
  if (/band/.test(name)) inferred.push('Resistance band')
  if (/dumbbell/.test(name)) inferred.push('Dumbbells')
  if (/barbell/.test(name)) inferred.push('Barbell')
  if (/kettlebell/.test(name)) inferred.push('Kettlebell')
  if (/bench/.test(name)) inferred.push('Bench')
  if (/(chair|table)/.test(name)) inferred.push('Sturdy chair/table')
  if (/(swim|natación|pool)/.test(name) || kind === 'swimming') inferred.push('Pool access')
  if (/(bike|cycling|bicicletta|stationary)/.test(name) || kind === 'cycling') inferred.push('Bike')
  if ((/(run|jog)/.test(name) || kind === 'running') && !name.includes('walking')) inferred.push('Running shoes')
  if (/(mat|plank|dead bug|hollow)/.test(name) || kind === 'core' || kind === 'mobility') inferred.push('Yoga mat')

  return uniqueEquipment([...apiEquipment, ...inferred])
}

function exerciseFitsEquipment(exercise: WgerExercise, kind: GoalKind, profile: PlanProfile) {
  return inferRequiredEquipment(exercise, kind).every((item) => hasEquipment(profile, item))
}

function toExerciseCard(exercise: WgerExercise, reason: string, kind: GoalKind): ExerciseCard {
  const name = getExerciseName(exercise)
  return {
    id: exercise.id,
    name,
    category: exercise.category?.name ?? 'Exercise',
    muscles: muscleNames(exercise),
    equipment: (exercise.equipment ?? []).map((item) => item.name),
    requiredEquipment: inferRequiredEquipment(exercise, kind),
    imageUrl: getImageUrl(exercise),
    description: getExerciseDescription(exercise),
    instructions: getSpecificInstructions(name, kind),
    commonMistakes: getCommonMistakes(name, kind),
    modification: getModification(name, kind),
    reason,
    source: exercise.license?.short_name ? `wger · ${exercise.license.short_name}` : 'wger workout API',
  }
}

function stableFallbackId(name: string) {
  return -Math.abs([...name].reduce((sum, character) => sum + character.charCodeAt(0), 0))
}

function fallbackExercise(name: string, reason: string, equipment: string[] = [], kind: GoalKind = 'general'): ExerciseCard {
  return {
    id: stableFallbackId(name),
    name,
    category: 'Planner progression',
    muscles: [],
    equipment,
    requiredEquipment: equipment,
    imageUrl: null,
    description: 'Planner-created progression used when the workout API does not provide this exact activity or regression.',
    instructions: getSpecificInstructions(name, kind),
    commonMistakes: getCommonMistakes(name, kind),
    modification: getModification(name, kind),
    reason,
    source: 'Planner progression',
  }
}

function getSpecificInstructions(name: string, kind: GoalKind) {
  const text = normalizeText(name)

  if (/(pull up warm up|pull-up warm-up|pull up prep|pull-up prep)/.test(text)) {
    return [
      'Do 10 slow shoulder circles forward, then 10 backward while standing tall.',
      'Do 10 shoulder-blade squeezes: arms by your sides, pinch shoulder blades back and down, then relax.',
      'Do 8 hip hinges with hands on hips so your back learns the position used for rows.',
      'Do 6 slow reach-and-pulls: reach both arms overhead, then pull elbows down toward your ribs as if starting a pull-up.',
      'Do 20-30 seconds of easy marching in place before the first strength set.',
    ]
  }

  if (/(running warm up|run warm up|running prep)/.test(text)) {
    return [
      'Walk easily for 2 minutes, then walk briskly for 2-3 minutes.',
      'Do 10 ankle circles each direction per foot while holding a wall if needed.',
      'Do 10 bodyweight calf raises, rising onto toes and lowering slowly.',
      'Do 10 gentle leg swings forward and back per leg, keeping the motion small and controlled.',
      'Jog or walk faster for 30 seconds, then start the planned run/walk intervals.',
    ]
  }

  if (/(swim warm up|swimming warm up|pool warm up)/.test(text)) {
    return [
      'On deck, do 10 shoulder circles forward and 10 backward.',
      'In the pool, complete 2-4 very easy lengths or 3-5 minutes of water walking.',
      'Practice 5 relaxed exhale cycles: face in the water, breathe bubbles out, then turn or lift to inhale.',
      'Swim one easy length focusing only on long reach and relaxed breathing.',
      'Rest until breathing feels normal before beginning the first planned interval.',
    ]
  }

  if (/(mobility and recovery work|mobility reset|recovery circuit)/.test(text)) {
    return [
      'Do 5 slow neck turns each direction, keeping shoulders relaxed.',
      'Do 10 shoulder circles forward and 10 backward.',
      'Do 8 cat-cow reps on hands and knees, moving one vertebra at a time.',
      'Do 6 hip hinges with hands on hips, stopping before your back rounds.',
      'Finish with 4 slow breaths: inhale through the nose, exhale fully, and let your shoulders drop.',
    ]
  }

  if (/(lying dumbbell row|chest supported dumbbell row|incline dumbbell row)/.test(text)) {
    return [
      'Set a bench to a low incline if possible. Lie chest-down on the bench with your head past the top edge, feet planted on the floor, and one dumbbell in each hand hanging straight down.',
      'If your bench is flat, lie face-down with your chest and stomach supported; keep your neck long and let the dumbbells hang toward the floor beside the bench.',
      'Start each rep by pulling shoulder blades gently back and down, then row the dumbbells toward the lower ribs.',
      'Pause for one second at the top without lifting your chest off the bench.',
      'Lower the dumbbells until arms are straight again, then repeat. If the exercise says “SS seated shrug,” finish the row reps first, then sit upright on the bench and do the shrug reps separately.',
    ]
  }

  if (/(seated shrug|shrug)/.test(text)) {
    return [
      'Sit tall on the front half of a bench or sturdy chair with feet flat and a dumbbell in each hand at your sides.',
      'Keep arms straight and neck long; do not bend elbows to lift the weights.',
      'Raise shoulders straight up toward your ears without rolling them forward or backward.',
      'Pause for one second at the top, then lower shoulders slowly as far down as comfortable.',
      'Repeat for the planned reps, keeping your chest tall and head still.',
    ]
  }

  if (/(bird dog|arm und beinheben|vierfüßlerstand|quadruped)/.test(text)) {
    return [
      'Start on hands and knees with hands under shoulders and knees under hips.',
      'Brace gently so your low back stays level like a tabletop.',
      'Reach your right arm forward and left leg back until both are straight, without letting hips rotate.',
      'Pause for one second, then return hand and knee to the floor with control.',
      'Switch sides and repeat. Move slowly enough that a cup on your low back would not spill.',
    ]
  }

  if (/(bent over row to external rotation)/.test(text)) {
    return [
      'Stand behind a sturdy chair or in front of a table. Hinge at your hips and place your forehead or one hand lightly on the support so your back stays flat.',
      'Let arms hang down toward the floor with palms facing back or inward.',
      'Row by pulling elbows toward your ribs until upper arms are beside your body.',
      'Keeping elbows near shoulder height, rotate forearms upward only as far as comfortable, then rotate them back down.',
      'Lower arms to the start and repeat slowly without shrugging your shoulders.',
    ]
  }

  if (/(active hang|dead hang|scapular)/.test(text)) {
    return [
      'Grip the bar with hands just outside shoulder width and step into position rather than jumping.',
      'Let arms straighten while keeping ribs down and shoulders gently pulled away from your ears.',
      'For scapular pulls, keep elbows straight and move only the shoulder blades: down slightly, then back to the start.',
      'Hold or repeat only while grip and shoulder position stay controlled.',
      'Step down carefully before grip fails so you do not drop suddenly.',
    ]
  }

  if (/(prone swimmer|back squeeze)/.test(text)) {
    return [
      'Lie face down with arms overhead or in a goalpost shape and forehead relaxed toward the floor.',
      'Gently lift chest, arms, and hands only as high as you can without pinching the low back.',
      'Pull elbows down toward your ribs while squeezing shoulder blades back and down.',
      'Pause for one second, then reach arms forward again with control.',
      'Keep the movement slow and light; this trains shoulder control when you do not have pulling equipment.',
    ]
  }

  if (/(pull ?up|chin ?up|dominada|klimmzug)/.test(text)) {
    return [
      'Grip the bar just outside shoulder width; use a band, machine, or foot support if you cannot complete clean reps yet.',
      'Start from a controlled active hang: ribs down, glutes lightly squeezed, shoulders pulled slightly down away from your ears.',
      'Pull your elbows down toward your ribs until your chin approaches or clears the bar without craning your neck.',
      'Pause briefly at the top, then lower under control until arms are straight again before the next rep.',
      'Rest long enough that every rep looks the same; stop the set before swinging or grinding begins.',
    ]
  }

  if (/(lat pull|front pull|pulldown|jalón)/.test(text)) {
    return [
      'Set the pad or band so you can sit tall with feet planted and arms reaching overhead.',
      'Begin by drawing shoulder blades down, then pull the handle toward the upper chest.',
      'Keep ribs stacked over hips; avoid leaning far back to turn it into a row.',
      'Pause for one second near the chest, then return slowly until arms are long and shoulders stay controlled.',
      'Choose a load that lets you complete all reps without shrugging or jerking.',
    ]
  }

  if (/(row|remo|rowing)/.test(text)) {
    return [
      'Set your body so your spine stays long and your shoulders start reaching forward without rounding hard.',
      'Pull elbows back toward your hips while squeezing shoulder blades gently together.',
      'Pause for one second with the handle, dumbbells, or body close to you.',
      'Lower slowly until arms are straight, keeping your trunk steady and neck relaxed.',
      'Use a range of motion that does not pinch the front of the shoulder.',
    ]
  }

  if (/(push ?up|press ?up)/.test(text)) {
    return [
      'Place hands under or slightly wider than shoulders; elevate hands if the floor version is too hard.',
      'Make a straight line from head to heels or knees, with ribs down and glutes lightly tight.',
      'Lower by bending elbows about 30-45 degrees from your sides until chest approaches the surface.',
      'Press the floor or surface away and return to a strong plank position.',
      'Stop the set when hips sag, shoulders shrug, or reps become uneven.',
    ]
  }

  if (/(run|jog|walking|walk|zone 2)/.test(text) || kind === 'running') {
    return [
      'Start with 5-10 minutes of brisk walking before you run or jog.',
      'Use short, relaxed steps and keep shoulders low, hands relaxed, and eyes forward.',
      'Run at a pace where you could speak in short sentences unless the plan calls for harder intervals.',
      'Use walk breaks before your form falls apart; resume running once breathing is controlled.',
      'Cool down with 3-5 minutes of easy walking and light calf, hip, and hamstring mobility.',
    ]
  }

  if (/(swim|natación|freestyle|pool)/.test(text) || kind === 'swimming') {
    return [
      'Begin each session with easy laps or water walking until breathing feels settled.',
      'Keep the body long in the water and exhale steadily underwater instead of holding your breath.',
      'For intervals, swim the planned distance smoothly, then rest until you can breathe normally again.',
      'Prioritize relaxed technique over speed: quiet kick, long reach, and controlled head position.',
      'Stop immediately if you feel unsafe, dizzy, panicked, or unable to control your breathing.',
    ]
  }

  if (/(bike|cycling|bicicletta|stationary)/.test(text) || kind === 'cycling') {
    return [
      'Adjust the seat so your knee stays slightly bent at the bottom of the pedal stroke.',
      'Warm up for 5-10 minutes with easy spinning before increasing effort.',
      'Pedal smoothly at a cadence you can control without bouncing in the saddle.',
      'For intervals, increase resistance or speed only enough to keep posture stable.',
      'Cool down with easy pedaling and gentle hip, quad, and calf mobility.',
    ]
  }

  if (/(plank|core|dead bug|hollow|abs)/.test(text) || kind === 'core') {
    return [
      'Set your ribs down and pelvis neutral before starting the rep or hold.',
      'Brace gently as if preparing for a cough while still breathing steadily.',
      'Move slowly and keep the low back from arching or twisting.',
      'End the set when you can no longer maintain position or breathing control.',
      'Choose an easier version if you feel pressure in your low back, neck, or pelvic floor.',
    ]
  }

  if (/(mobility|stretch|warmup|lunge|rotation)/.test(text) || kind === 'mobility') {
    return [
      'Move slowly into a comfortable range; do not force the end position.',
      'Breathe out as you move deeper and keep the rest of your body relaxed.',
      'Hold or repeat the movement long enough to feel warmer, not strained.',
      'Match both sides, but spend extra time on the tighter side if it feels helpful.',
      'Stop if you feel sharp pain, numbness, or joint pinching.',
    ]
  }

  if (/(squat|lunge|deadlift|hinge|press|curl|extension)/.test(text) || kind === 'strength') {
    return [
      'Set up with stable feet, a braced trunk, and the load close to your body when possible.',
      'Move through a pain-free range with a controlled 2-3 second lowering phase.',
      'Pause briefly in the hardest position without losing posture.',
      'Drive back to the start while keeping knees, hips, shoulders, and spine aligned.',
      'Stop with 1-3 good reps left in reserve unless your plan specifically says otherwise.',
    ]
  }

  return [
    'Start with a light warm-up set or easy version of the movement.',
    'Move through a controlled, pain-free range of motion.',
    'Keep breathing steady and stop before technique breaks down.',
    'Rest as needed so the next set is as clean as the first.',
    'Record what you completed so the next session can progress gradually.',
  ]
}

function getCommonMistakes(name: string, kind: GoalKind) {
  const text = normalizeText(name)
  if (/(pull ?up|chin ?up|lat pull|front pull|pulldown|jalón|active hang|dead hang|scapular|prone swimmer|back squeeze)/.test(text) || kind === 'pull-up') {
    return ['Shrugging shoulders into ears', 'Kicking or swinging for momentum', 'Rushing reps instead of controlling shoulder position']
  }
  if (/(run|jog|walking|walk)/.test(text) || kind === 'running') {
    return ['Starting too fast', 'Skipping walk breaks', 'Letting stride get long and heavy when tired']
  }
  if (/(swim|natación)/.test(text) || kind === 'swimming') {
    return ['Holding breath', 'Rushing technique for speed', 'Resting too little between intervals']
  }
  if (/(push ?up|press ?up)/.test(text) || kind === 'push-up') {
    return ['Hips sagging', 'Elbows flaring straight out', 'Stopping short of a controlled range']
  }
  return ['Rushing reps', 'Using a range that causes pain', 'Adding difficulty before the movement is controlled']
}

function getModification(name: string, kind: GoalKind) {
  const text = normalizeText(name)
  if (/(active hang|dead hang|scapular)/.test(text)) return 'Make it easier with shorter holds and foot support; make it harder by adding seconds or slow scapular pulls.'
  if (/(prone swimmer|back squeeze)/.test(text)) return 'Make it easier by keeping arms lower or doing fewer reps; make it harder by pausing longer in the squeeze.'
  if (/(pull ?up|chin ?up)/.test(text) || kind === 'pull-up') return 'Make it easier with a stronger band, foot support, or a no-equipment back-squeeze substitute; make it harder by using less assistance or a slower lower.'
  if (/(push ?up|press ?up)/.test(text) || kind === 'push-up') return 'Make it easier by raising your hands on a bench or wall; make it harder by lowering the incline or slowing the descent.'
  if (/(run|jog|walking|walk)/.test(text) || kind === 'running') return 'Make it easier with more walking and shorter run intervals; make it harder by adding minutes before adding speed.'
  if (/(swim|natación)/.test(text) || kind === 'swimming') return 'Make it easier with shorter repeats and longer rests; make it harder by adding laps before increasing speed.'
  if (/(bike|cycling|bicicletta|stationary)/.test(text) || kind === 'cycling') return 'Make it easier by lowering resistance; make it harder by adding time or a small resistance increase.'
  return 'Make it easier by reducing range, load, speed, or time; make it harder by adding one small variable at a time.'
}

function classifyGoal(goal: string): GoalKind {
  const text = normalizeText(goal)
  if (/(pull ?up|chin ?up|dominada|klimmzug)/.test(text)) return 'pull-up'
  if (/(push ?up|press ?up)/.test(text)) return 'push-up'
  if (/(swim|freestyle|breaststroke|backstroke|lap|laps)/.test(text)) return 'swimming'
  if (/(bike|biking|cycle|cycling|spin)/.test(text)) return 'cycling'
  if (/(run|jog|5k|10k|marathon|mile|miles)/.test(text)) return 'running'
  if (/(plank|core|abs|sit ?up)/.test(text)) return 'core'
  if (/(mobility|flexib|stretch|split|yoga)/.test(text)) return 'mobility'
  if (/(squat|deadlift|bench|strength|muscle|lift|tone|hypertrophy)/.test(text)) return 'strength'
  return 'general'
}

function targetFromGoal(goal: string) {
  const text = normalizeText(goal)
  if (text.includes('half') && text.includes('mile')) return '0.5 miles'
  const numberMatch = text.match(/(\d+(?:\.\d+)?)/)
  const number = numberMatch ? Number(numberMatch[1]) : null
  if (number === null) return null
  if (text.includes('mile')) return `${number} mile${number === 1 ? '' : 's'}`
  if (text.includes('km') || text.includes('kilometer')) return `${number} km`
  if (text.includes('minute')) return `${number} minutes`
  if (text.includes('pull') || text.includes('push') || text.includes('rep')) return `${number} rep${number === 1 ? '' : 's'}`
  return `${number}`
}

function goalLabel(kind: GoalKind) {
  const labels: Record<GoalKind, string> = {
    'pull-up': 'pull-up',
    'push-up': 'push-up',
    running: 'running',
    swimming: 'swimming',
    cycling: 'cycling',
    strength: 'strength',
    core: 'core',
    mobility: 'mobility',
    general: 'fitness',
  }
  return labels[kind]
}

function exerciseMatchesGoal(exercise: WgerExercise, kind: GoalKind) {
  const name = normalizeText(getExerciseName(exercise))
  if (kind === 'pull-up') return /(pull ?up|chin ?up|dominada|klimmzug|lat pull|front pull|row|remo|rowing|pulldown|jalón)/.test(name)
  if (kind === 'push-up') return /(push ?up|press ?up|chest|bench|fly|press)/.test(name)
  if (kind === 'running') return /(run|jog|walking|walk|knee|step|zone 2|crosstrainer)/.test(name)
  if (kind === 'swimming') return /(swim|natación|freestyle|row|shoulder|lat|pullover)/.test(name)
  if (kind === 'cycling') return /(bike|cycling|bicicletta|stationary|crosstrainer|quad|calf|glute)/.test(name)
  if (kind === 'core') return /(plank|core|crunch|dead bug|abs|hollow|sit ?up)/.test(name)
  if (kind === 'mobility') return /(stretch|mobility|warmup|cat|cow|lunge|rotation)/.test(name)
  if (kind === 'strength') return /(squat|deadlift|row|press|lunge|pull|push|curl|extension)/.test(name)
  return true
}

function scoreExercise(exercise: WgerExercise, kind: GoalKind) {
  const name = normalizeText(getExerciseName(exercise))
  const category = normalizeText(exercise.category?.name ?? '')
  const muscles = muscleNames(exercise).map(normalizeText).join(' ')
  let score = exerciseMatchesGoal(exercise, kind) ? 15 : 0

  if (kind === 'pull-up') {
    if (/(pull ?up|chin ?up|dominada|klimmzug)/.test(name)) score += 25
    if (/(lat pull|front pull|pulldown|jalón)/.test(name)) score += 18
    if (/(row|remo|rowing)/.test(name)) score += 12
    if (muscles.includes('lats') || muscles.includes('biceps')) score += 8
    if (name.includes('rowing machine')) score -= 10
    if (/(archer|typewriter|one arm)/.test(name)) score -= 8
  }

  if (kind === 'running') {
    if (/(run|jog|zone 2)/.test(name)) score += 25
    if (/(walking|walk|step)/.test(name)) score += 14
    if (category === 'cardio') score += 8
  }

  if (kind === 'swimming') {
    if (/(swim|natación)/.test(name)) score += 25
    if (/(row|pullover|lat|shoulder)/.test(name)) score += 10
    if (category === 'cardio') score += 6
  }

  if (kind === 'push-up') {
    if (/(push ?up|press ?up)/.test(name)) score += 25
    if (category === 'chest' || muscles.includes('chest') || muscles.includes('triceps')) score += 10
  }

  if (kind === 'cycling' && (category === 'cardio' || muscles.includes('quads') || muscles.includes('glutes'))) score += 12
  if (kind === 'core' && (category === 'abs' || muscles.includes('abs'))) score += 12
  if (kind === 'strength' && ['back', 'chest', 'legs', 'arms', 'shoulders'].includes(category)) score += 8

  if (name.includes('walking') && kind !== 'running') score -= 6
  return score
}

function uniqueCards(cards: ExerciseCard[]) {
  const seen = new Set<number>()
  return cards.filter((card) => {
    if (seen.has(card.id)) return false
    seen.add(card.id)
    return true
  })
}

function buildExerciseLibrary(exercises: WgerExercise[], kind: GoalKind, profile: PlanProfile) {
  const reason = `Supports your ${goalLabel(kind)} goal with related movement practice or accessory strength and matches your available equipment.`
  const usableExercises = exercises.filter((exercise) => exerciseFitsEquipment(exercise, kind, profile))
  const primary = usableExercises
    .filter((exercise) => exerciseMatchesGoal(exercise, kind))
    .sort((a, b) => scoreExercise(b, kind) - scoreExercise(a, kind))
    .slice(0, 12)
    .map((exercise) => toExerciseCard(exercise, reason, kind))

  const backup = usableExercises
    .sort((a, b) => scoreExercise(b, kind) - scoreExercise(a, kind))
    .slice(0, 8)
    .map((exercise) => toExerciseCard(exercise, reason, kind))

  return uniqueCards([...primary, ...backup]).slice(0, 12)
}

function readinessScore(profile: PlanProfile, kind: GoalKind) {
  const text = normalizeText(`${profile.currentAbility} ${profile.goal}`)
  let score = profile.experience === 'advanced' ? 68 : profile.experience === 'intermediate' ? 55 : profile.experience === 'beginner' ? 38 : 24

  if (/(none|zero|can't|cannot|not yet|never)/.test(text)) score -= 15
  if (/(some|few|beginner|walk|assisted|short)/.test(text)) score += 4
  if (/(already|can do|comfortable|easy|regularly)/.test(text)) score += 14
  if (/(injury|pain|limited|rehab)/.test(text)) score -= 10
  if (profile.condition === 'healthy') score += 5
  if (profile.condition === 'returning') score -= 4
  if (profile.condition !== 'healthy' && profile.condition !== 'returning') score -= 12
  if (profile.age >= 65) score -= 8
  if (profile.age >= 50) score -= 4
  if (kind === 'mobility') score += 10

  return clamp(Math.round(score), 5, 95)
}

function plannedIntensity(score: number, week: number, totalWeeks: number) {
  const ramp = totalWeeks <= 1 ? 1 : (week - 1) / (totalWeeks - 1)
  const base = score < 35 ? 0.55 : score < 60 ? 0.65 : 0.75
  return clamp(Math.round((base + ramp * 0.15) * 100), 45, 88)
}

function firstLibraryExercise(library: ExerciseCard[], kind: GoalKind, fallbackName: string, reason: string, profile: PlanProfile) {
  if (kind === 'pull-up' && !hasEquipment(profile, 'Pull-up bar') && !hasEquipment(profile, 'Resistance band') && !hasEquipment(profile, 'Dumbbells') && !hasEquipment(profile, 'Gym/cable machine')) {
    return fallbackForGoal(kind, profile, fallbackName, reason)
  }

  const matching = library.find((exercise) => {
    const pseudoExercise: WgerExercise = { id: exercise.id, translations: [{ name: exercise.name }], category: { id: 0, name: exercise.category } }
    return exercise.requiredEquipment.every((item) => hasEquipment(profile, item)) && exerciseMatchesGoal(pseudoExercise, kind)
  })
  const fallback = fallbackForGoal(kind, profile, fallbackName, reason)
  return matching ?? library.find((exercise) => exercise.requiredEquipment.every((item) => hasEquipment(profile, item))) ?? fallback
}

function fallbackForGoal(kind: GoalKind, profile: PlanProfile, fallbackName: string, reason: string) {
  if (kind === 'pull-up') {
    if (hasEquipment(profile, 'Pull-up bar')) return fallbackExercise('Active hang and scapular pull', reason, ['Pull-up bar'], kind)
    if (hasEquipment(profile, 'Resistance band')) return fallbackExercise('Band lat pulldown', reason, ['Resistance band'], kind)
    if (hasEquipment(profile, 'Dumbbells')) return fallbackExercise('One-arm dumbbell row', reason, ['Dumbbells'], kind)
    return fallbackExercise('Prone swimmer pull and towel-free back squeeze', reason, [], kind)
  }

  if (kind === 'swimming') {
    if (hasEquipment(profile, 'Pool access')) return fallbackExercise('Easy pool intervals', reason, ['Pool access'], kind)
    if (hasEquipment(profile, 'Resistance band')) return fallbackExercise('Dryland band swim pull', reason, ['Resistance band'], kind)
    return fallbackExercise('Dryland swim breathing and shoulder endurance', reason, [], kind)
  }

  if (kind === 'cycling') {
    if (hasEquipment(profile, 'Bike')) return fallbackExercise('Easy bike intervals', reason, ['Bike'], kind)
    return fallbackExercise('Low-impact cardio intervals', reason, [], kind)
  }

  if (kind === 'running') {
    if (hasEquipment(profile, 'Running shoes')) return fallbackExercise('Run/walk intervals', reason, ['Running shoes'], kind)
    return fallbackExercise('Low-impact walking intervals', reason, [], kind)
  }

  return fallbackExercise(fallbackName, reason, [], kind)
}

function activityForGoal(kind: GoalKind) {
  const defaults: Record<GoalKind, string> = {
    'pull-up': 'assisted pull-up practice',
    'push-up': 'incline or standard push-up practice',
    running: 'run/walk intervals',
    swimming: 'pool intervals',
    cycling: 'bike intervals',
    strength: 'full-body strength circuit',
    core: 'core circuit',
    mobility: 'mobility flow',
    general: 'mixed cardio and strength circuit',
  }
  return defaults[kind]
}

function supportForGoal(kind: GoalKind) {
  const defaults: Record<GoalKind, string> = {
    'pull-up': 'rows, pulldowns, hangs, and trunk stability',
    'push-up': 'chest, shoulder, triceps, row, and plank work',
    running: 'walking, easy running, leg strength, and mobility',
    swimming: 'easy swimming, technique drills, shoulder endurance, and breathing practice',
    cycling: 'easy cycling, cadence work, leg strength, and hip mobility',
    strength: 'compound lifts, accessory work, and recovery mobility',
    core: 'anti-extension, anti-rotation, flexion control, and breathing',
    mobility: 'controlled range of motion, gentle strength, and breathing',
    general: 'cardio base, strength basics, and mobility',
  }
  return defaults[kind]
}

function warmUpForGoal(kind: GoalKind) {
  if (kind === 'pull-up') return fallbackExercise('Pull-up warm-up prep', 'A specific no-equipment warm-up for shoulders, upper back, and trunk before pulling work.', [], kind)
  if (kind === 'running') return fallbackExercise('Running warm-up prep', 'A specific warm-up before run/walk intervals.', [], kind)
  if (kind === 'swimming') return fallbackExercise('Swimming warm-up prep', 'A specific pool warm-up before swim intervals.', [], kind)
  return fallbackExercise('Mobility and recovery work', 'A specific warm-up sequence for the joints used in this plan.', [], 'mobility')
}

function warmUpPrescriptionFor(kind: GoalKind) {
  if (kind === 'pull-up') return 'Complete this exact sequence once: 10 shoulder circles forward, 10 backward, 10 shoulder-blade squeezes, 8 hip hinges, 6 slow reach-and-pulls, then 20-30 seconds marching in place.'
  if (kind === 'running') return 'Complete this exact sequence once: 2 minutes easy walking, 2 minutes brisk walking, 10 calf raises, 10 leg swings per side, then 30 seconds easy jogging or faster walking.'
  if (kind === 'swimming') return 'Complete this exact sequence once: 10 shoulder circles each way on deck, 2-4 very easy lengths or 3-5 minutes water walking, then 5 relaxed exhale cycles in the water.'
  return 'Complete this exact sequence once: 5 neck turns each direction, 10 shoulder circles each way, 8 cat-cow reps, 6 hip hinges, then 4 slow breaths.'
}

function mainPrescriptionFor(exercise: ExerciseCard, kind: GoalKind, isHard: boolean, weekIntensity: number, targetText: string) {
  const name = normalizeText(exercise.name)

  if (kind === 'running') {
    return isHard
      ? `After the warm-up, do 6 rounds: run or jog 1 minute at about ${weekIntensity}% effort, then walk 90 seconds. Cool down with 3-5 minutes easy walking${targetText}.`
      : 'Do 20-30 minutes total: alternate 2 minutes brisk walking with 1 minute very easy jogging, keeping breathing conversational.'
  }

  if (kind === 'swimming') {
    return isHard
      ? `After the warm-up, swim 6-10 repeats of 25-50 meters at about ${weekIntensity}% effort. Rest 30-60 seconds between repeats, or until breathing is calm${targetText}.`
      : 'Swim 10-20 easy minutes total as short relaxed repeats. Rest at the wall whenever breathing or technique starts to feel messy.'
  }

  if (kind === 'cycling') {
    return isHard
      ? `After the warm-up, do 6 rounds: pedal 2 minutes at about ${weekIntensity}% effort, then pedal 2 minutes very easy.`
      : 'Ride 20-40 minutes at an easy pace where you can speak in full sentences.'
  }

  if (/(lying dumbbell row|chest supported dumbbell row|ss seated shrug)/.test(name)) {
    return isHard
      ? 'Do 4 supersets: 8-12 lying dumbbell rows, immediately sit upright and do 10-15 seated dumbbell shrugs, then rest 90 seconds.'
      : 'Do 3 supersets: 8 easy lying dumbbell rows, then 10 easy seated dumbbell shrugs. Rest 60-90 seconds between supersets.'
  }

  if (/(one arm.*row|one-arm.*row|dumbbell row)/.test(name)) {
    return isHard
      ? 'Do 4 sets of 8-12 reps per side. Rest 60-90 seconds after both sides are complete.'
      : 'Do 3 sets of 8 reps per side at an easy effort. Rest 60 seconds after both sides are complete.'
  }

  if (/(row|remo|rowing)/.test(name)) {
    return isHard
      ? 'Do 4 sets of 8-12 controlled reps. Rest 60-90 seconds between sets.'
      : 'Do 3 sets of 8-10 controlled reps at an easy effort. Rest 60 seconds between sets.'
  }

  if (/(pull ?up|chin ?up|active hang|scapular)/.test(name)) {
    return isHard
      ? 'Do 4-6 sets of 3-6 assisted reps or 10-20 second active hangs. Rest 90-120 seconds between sets.'
      : 'Do 3-4 easy sets of 3 assisted reps or 10 second active hangs. Stop well before grip fails.'
  }

  if (/(prone swimmer|back squeeze)/.test(name)) {
    return isHard
      ? 'Do 4 sets of 8-12 slow reps. Each rep: reach overhead, pull elbows to ribs, squeeze 1 second, then reach forward again. Rest 45-60 seconds.'
      : 'Do 3 sets of 6-8 slow reps, resting 45 seconds between sets.'
  }

  if (/(push ?up|press ?up)/.test(name)) {
    return isHard
      ? 'Do 4 sets of 5-10 controlled reps. Rest 60-90 seconds between sets and stop before your hips sag.'
      : 'Do 3 easy sets of 5 controlled reps using an incline if needed.'
  }

  return isHard
    ? `Do 4 sets of 8-12 controlled reps at about ${weekIntensity}% effort. Rest 60-90 seconds between sets.`
    : 'Do 3 easy sets of 8 controlled reps. Rest 60 seconds between sets.'
}

function supportPrescriptionFor(exercise: ExerciseCard, kind: GoalKind) {
  const name = normalizeText(exercise.name)
  if (/(bird dog|arm und beinheben|vierfüßlerstand|quadruped)/.test(name)) return 'Do 3 rounds of 6 slow reps per side, resting 30-45 seconds between rounds.'
  if (/(lying dumbbell row|row|remo|rowing)/.test(name)) return 'Do 3 sets of 8-12 controlled reps, resting 60 seconds between sets.'
  if (kind === 'running') return 'Do 2 rounds: 10 bodyweight calf raises, 8 slow step-backs per side, and 30 seconds easy walking.'
  if (kind === 'swimming') return 'Do 2 rounds: 10 shoulder blade squeezes, 8 slow reach-and-pulls, and 5 relaxed breathing cycles.'
  return `Do 2-3 rounds using ${exercise.name}: 8-12 controlled reps or 20-30 seconds per hold, resting as needed.`
}

function buildSessions(profile: PlanProfile, kind: GoalKind, library: ExerciseCard[], score: number) {
  const mainExercise = firstLibraryExercise(library, kind, activityForGoal(kind), `Main practice for your ${goalLabel(kind)} goal.`, profile)
  const supportExercise = library.find((exercise) => exercise.id !== mainExercise.id && exercise.requiredEquipment.every((item) => hasEquipment(profile, item))) ?? fallbackForGoal(kind, profile, supportForGoal(kind), 'Accessory work that supports the goal.')
  const recoveryExercise = warmUpForGoal(kind)
  const target = targetFromGoal(profile.goal)
  const targetText = target ? ` toward ${target}` : ''

  const sessions: WorkoutSession[] = []
  for (let index = 0; index < profile.daysPerWeek; index += 1) {
    const dayNumber = index + 1
    const weekIntensity = plannedIntensity(score, Math.min(dayNumber, profile.timelineWeeks), profile.timelineWeeks)
    const isHard = index === 0 || index === 2
    const isRecovery = index === 3 || index === 4

    if (isRecovery) {
      sessions.push({
        day: `Day ${dayNumber}`,
        focus: dayNumber === 4 ? 'Recovery technique' : 'Optional easy volume',
        duration: `${profile.sessionMinutes} min`,
        blocks: [
          {
            name: 'Easy practice',
            prescription: mainPrescriptionFor(mainExercise, kind, false, weekIntensity, targetText),
            cue: 'You should finish feeling like you could do more.',
            exercises: [mainExercise],
          },
          {
            name: 'Mobility reset',
            prescription: '8-12 minutes of gentle mobility for the joints and muscles used most in your goal.',
            cue: 'Move through comfortable ranges and breathe steadily.',
            exercises: [recoveryExercise],
          },
        ],
        note: 'Skip this day or shorten it if recovery is not good.',
      })
      continue
    }

    sessions.push({
      day: `Day ${dayNumber}`,
      focus: isHard ? `${goalLabel(kind)} practice` : 'Base-building support',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Warm-up',
          prescription: warmUpPrescriptionFor(kind),
          cue: 'Warm and coordinated beats tired and rushed.',
          exercises: [recoveryExercise],
        },
        {
          name: isHard ? 'Main goal work' : 'Technique volume',
          prescription: mainPrescriptionFor(mainExercise, kind, isHard, weekIntensity, targetText),
          cue: kind === 'running' || kind === 'swimming' || kind === 'cycling'
            ? 'Keep the first half controlled so the final reps or minutes stay smooth.'
            : 'Stop each set before form breaks or pain appears.',
          exercises: [mainExercise],
        },
        {
          name: 'Support work',
          prescription: supportPrescriptionFor(supportExercise, kind),
          cue: 'Accessory work should build capacity, not drain tomorrow’s workout.',
          exercises: [supportExercise],
        },
      ],
      note: isHard ? 'Put this session after a rest or easy day when possible.' : 'This session builds the base that makes the goal sustainable.',
    })
  }

  return sessions
}

function buildProgression(profile: PlanProfile, kind: GoalKind, score: number) {
  const target = targetFromGoal(profile.goal)
  const targetText = target ? ` for ${target}` : ''
  const gentleStart = score < 35 || profile.condition !== 'healthy'

  return [
    `Week 1: Establish a comfortable baseline${targetText}; stop every workout while form and breathing are still controlled.`,
    gentleStart
      ? 'Week 2: Add only one small progression: a few minutes, one set, slightly less assistance, or a lower incline.'
      : 'Week 2: Add 5-10% more total work or make one key exercise slightly harder.',
    kind === 'running' || kind === 'swimming' || kind === 'cycling'
      ? 'Week 3: Include one longer easy session and one interval/technique session; keep the rest easy.'
      : 'Week 3: Increase quality practice while keeping accessory work submaximal.',
    `Final week: Reduce volume 20-30% before a rested test of “${profile.goal},” then note what felt strongest and weakest.`,
  ].slice(0, Math.max(3, Math.min(profile.timelineWeeks, 6)))
}

function buildAdaptations(profile: PlanProfile, kind: GoalKind) {
  const adaptations = [
    `Planner classified this as a ${goalLabel(kind)} goal and selected related exercises from the workout API.`,
    `Current ability you entered: ${profile.currentAbility || 'not specified'}.`,
    `Schedule: ${profile.daysPerWeek} days/week, ${profile.sessionMinutes} minutes/session, over ${profile.timelineWeeks} weeks.`,
  ]

  if (profile.condition !== 'healthy') {
    adaptations.push('Volume and intensity should stay conservative; reduce the plan on any day symptoms increase.')
  }

  if (profile.age >= 50) {
    adaptations.push('Use a longer warm-up and keep at least 48 hours between the hardest sessions.')
  }

  if (profile.gender === 'prefer-not' || profile.gender === 'nonbinary') {
    adaptations.push('Progression is based on ability, recovery, and symptoms rather than gender assumptions.')
  }

  if (profile.equipment.length > 0) {
    adaptations.push(`Available equipment: ${profile.equipment.join(', ')}.`)
  }

  if (profile.injuryNotes.trim()) {
    adaptations.push(`Limitations to respect: ${profile.injuryNotes.trim()}`)
  }

  if (profile.scheduleNotes.trim()) {
    adaptations.push(`Preference notes: ${profile.scheduleNotes.trim()}`)
  }

  return adaptations
}

function buildSafetyNotes(profile: PlanProfile, kind: GoalKind) {
  const notes = [
    'This is an educational plan, not medical advice. Stop for sharp pain, dizziness, chest pain, numbness, or symptoms that worsen during training.',
    'Progress only one variable at a time: duration, reps, sets, speed, distance, load, or assistance level.',
  ]

  if (kind === 'running') notes.push('Increase running volume gradually and use walk breaks before form or breathing breaks down.')
  if (kind === 'swimming') notes.push('Swim where it is safe and supervised if needed; stop if breathing rhythm becomes uncontrolled.')
  if (kind === 'pull-up' || kind === 'push-up') notes.push('Protect shoulders, elbows, and wrists by using controlled reps and pain-free ranges.')
  if (profile.condition !== 'healthy' || profile.age >= 50) notes.push('Consider clinician clearance before beginning or intensifying exercise.')

  return notes
}

function normalizeProfile(input: PlanProfile): PlanProfile {
  return {
    goal: input.goal?.trim() || 'Improve general fitness',
    currentAbility: input.currentAbility?.trim() || 'Not specified',
    age: clamp(Number(input.age), 12, 90),
    gender: input.gender ?? 'prefer-not',
    condition: input.condition ?? 'healthy',
    experience: input.experience ?? 'beginner',
    daysPerWeek: clamp(Number(input.daysPerWeek), 2, 6),
    sessionMinutes: clamp(Number(input.sessionMinutes), 10, 90),
    timelineWeeks: clamp(Number(input.timelineWeeks), 1, 24),
    equipment: Array.isArray(input.equipment) ? input.equipment.filter((item) => typeof item === 'string') : [],
    injuryNotes: input.injuryNotes?.trim() ?? '',
    scheduleNotes: input.scheduleNotes?.trim() ?? '',
  }
}

async function fetchExercises(kind: GoalKind) {
  const category = categoryByGoal[kind]
  const queryParams: Record<string, string> = {
    language: '2',
    limit: '80',
  }

  if (category) {
    queryParams['category'] = category
  } else if (kind === 'general' || kind === 'strength') {
    queryParams['limit'] = '100'
  }

  const response = await workoutApi.rawRequest<WgerExerciseResponse>({
    path: 'exerciseinfo/',
    method: 'GET',
    queryParams,
  })

  return response.data
}

export default async function createWorkoutPlan(req: { params: PlanProfile; user: User }): Promise<WorkoutPlan> {
  const profile = normalizeProfile(req.params)
  const kind = classifyGoal(profile.goal)
  const apiResponse = await fetchExercises(kind)
  const exerciseLibrary = buildExerciseLibrary(apiResponse.results ?? [], kind, profile)
  const score = readinessScore(profile, kind)

  return {
    title: `${profile.timelineWeeks}-week plan for ${profile.goal}`,
    summary: `A ${profile.daysPerWeek}-day ${goalLabel(kind)} plan using ${exerciseLibrary.length} related exercises from your workout API and your submitted profile.`,
    goalKind: kind,
    timelineWeeks: profile.timelineWeeks,
    readinessScore: score,
    apiExerciseCount: apiResponse.count,
    sessions: buildSessions(profile, kind, exerciseLibrary, score),
    progression: buildProgression(profile, kind, score),
    milestones: [
      'Start: Record your baseline exactly as it is today, without judging it.',
      'Midpoint: Repeat one baseline test after an easy day and compare quality, not just numbers.',
      `Final week: Retest “${profile.goal}” after a rest day and full warm-up.`,
    ],
    adaptations: buildAdaptations(profile, kind),
    safetyNotes: buildSafetyNotes(profile, kind),
    exerciseLibrary,
  }
}
