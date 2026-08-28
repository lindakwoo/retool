type Gender = 'woman' | 'man' | 'nonbinary' | 'prefer-not'
type Condition = 'healthy' | 'returning' | 'joint-pain' | 'pregnancy-postpartum' | 'chronic-condition' | 'injury-rehab'
type Experience = 'new' | 'beginner' | 'intermediate' | 'advanced'

type PlanProfile = {
  goal: string
  gender: Gender
  age: number
  condition: Condition
  experience: Experience
  daysPerWeek: number
  sessionMinutes: number
  canHangSeconds: number
  assistedPullups: number
  negativeSeconds: number
  currentPullups: number
  equipment: string[]
  injuryNotes: string
  scheduleNotes: string
}

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
  imageUrl: string | null
  description: string
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

type PullUpPlan = {
  title: string
  summary: string
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

function lower(value: string) {
  return value.toLowerCase()
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

function toExerciseCard(exercise: WgerExercise, reason: string): ExerciseCard {
  return {
    id: exercise.id,
    name: getExerciseName(exercise),
    category: exercise.category?.name ?? 'Exercise',
    muscles: [
      ...(exercise.muscles ?? []).map((muscle) => muscle.name_en || muscle.name),
      ...(exercise.muscles_secondary ?? []).map((muscle) => muscle.name_en || muscle.name),
    ].filter(Boolean),
    equipment: (exercise.equipment ?? []).map((item) => item.name),
    imageUrl: getImageUrl(exercise),
    description: getExerciseDescription(exercise),
    reason,
    source: exercise.license?.short_name ? `wger · ${exercise.license.short_name}` : 'wger workout API',
  }
}

function matchesAny(name: string, terms: string[]) {
  const normalizedName = lower(name)
  return terms.some((term) => normalizedName.includes(term))
}

function scoreExercise(exercise: WgerExercise) {
  const name = lower(getExerciseName(exercise))
  let score = 0

  if (name.includes('pull up') || name.includes('pull-up') || name.includes('pullup')) score += 22
  if (name.includes('chin')) score += 18
  if (name.includes('lat pull') || name.includes('front pull') || name.includes('pulldown') || name.includes('jalón')) score += 15
  if (name.includes('row') || name.includes('remo') || name.includes('rowing')) score += 12
  if (name.includes('scap') || name.includes('superman')) score += 8
  if (name.includes('archer') || name.includes('typewriter') || name.includes('one-arm')) score -= 8
  if (name.includes('walking') || name.includes('romanian deadlift')) score -= 15

  const primaryMuscles = exercise.muscles ?? []
  const secondaryMuscles = exercise.muscles_secondary ?? []
  if (primaryMuscles.some((muscle) => muscle.id === 12)) score += 8
  if (secondaryMuscles.some((muscle) => muscle.id === 1)) score += 4
  if (secondaryMuscles.some((muscle) => muscle.id === 9)) score += 3

  return score
}

function selectExercises(exercises: WgerExercise[], terms: string[], reason: string, limit: number) {
  return exercises
    .filter((exercise) => matchesAny(getExerciseName(exercise), terms))
    .sort((a, b) => scoreExercise(b) - scoreExercise(a))
    .slice(0, limit)
    .map((exercise) => toExerciseCard(exercise, reason))
}

function uniqueCards(cards: ExerciseCard[]) {
  const seen = new Set<number>()
  return cards.filter((card) => {
    if (seen.has(card.id)) return false
    seen.add(card.id)
    return true
  })
}

function firstOrFallback(cards: ExerciseCard[], fallback: ExerciseCard) {
  return cards[0] ?? fallback
}

function getFallbackExercise(name: string, reason: string, equipment: string[] = []) {
  return {
    id: -Math.floor(Math.random() * 1_000_000),
    name,
    category: 'Pull-up progression',
    muscles: ['Lats', 'Biceps', 'Trapezius', 'Core'],
    equipment,
    imageUrl: null,
    description: 'Planner-created progression used when the workout API does not provide this exact regression.',
    reason,
    source: 'Planner progression',
  }
}

function getReadinessScore(profile: PlanProfile) {
  const hangScore = clamp(profile.canHangSeconds / 30, 0, 1) * 35
  const assistedScore = clamp(profile.assistedPullups / 8, 0, 1) * 25
  const negativeScore = clamp(profile.negativeSeconds / 8, 0, 1) * 20
  const pullupScore = clamp(profile.currentPullups, 0, 1) * 20
  const conditionPenalty = profile.condition === 'healthy' ? 0 : profile.condition === 'returning' ? 6 : 12
  return clamp(Math.round(hangScore + assistedScore + negativeScore + pullupScore - conditionPenalty), 5, 100)
}

function getLevel(profile: PlanProfile) {
  if (profile.currentPullups >= 1) return 'maintain and build repeatable pull-ups'
  if (profile.canHangSeconds >= 25 && profile.negativeSeconds >= 5) return 'near first pull-up'
  if (profile.canHangSeconds >= 10 || profile.assistedPullups >= 3) return 'building pulling strength'
  return 'foundation and grip strength'
}

function buildAdaptations(profile: PlanProfile) {
  const adaptations = [
    `Goal: ${profile.goal || 'Complete one pull-up in one month'}. Current level: ${getLevel(profile)}.`,
    `Training is set for ${profile.daysPerWeek} days per week at about ${profile.sessionMinutes} minutes per session.`,
  ]

  if (profile.age >= 55) {
    adaptations.push('Use a longer warm-up, keep reps controlled, and avoid testing max effort more than once per week.')
  } else if (profile.age >= 40) {
    adaptations.push('Keep one full recovery day between harder pulling sessions when elbows or shoulders feel tender.')
  }

  if (profile.experience === 'new') {
    adaptations.push('Start with hangs, scapular control, rows, and band-assisted reps before negatives.')
  } else if (profile.experience === 'advanced') {
    adaptations.push('Add small amounts of intensity only if every rep starts from controlled shoulders and a tight trunk.')
  }

  if (profile.condition === 'joint-pain' || profile.condition === 'injury-rehab') {
    adaptations.push('Use neutral grips, shorter ranges, and pain-free pulling angles; stop if symptoms increase during the set.')
  }

  if (profile.condition === 'pregnancy-postpartum') {
    adaptations.push('Avoid breath-holding and maximal bracing; get clearance before high-intensity hanging or core work.')
  }

  if (profile.condition === 'chronic-condition') {
    adaptations.push('Keep intensity conversational, extend rests, and reduce volume when symptoms or fatigue rise.')
  }

  if (profile.equipment.length > 0) {
    adaptations.push(`Equipment available: ${profile.equipment.join(', ')}.`)
  }

  if (profile.injuryNotes.trim()) {
    adaptations.push(`Your notes to account for: ${profile.injuryNotes.trim()}`)
  }

  if (profile.scheduleNotes.trim()) {
    adaptations.push(`Scheduling preference: ${profile.scheduleNotes.trim()}`)
  }

  return adaptations
}

function buildProgression(profile: PlanProfile) {
  if (profile.currentPullups >= 1) {
    return [
      'Week 1: Practice crisp singles, then complete assisted volume without grinding.',
      'Week 2: Build several sets of 1-2 pull-ups, resting at least 2 minutes between efforts.',
      'Week 3: Accumulate 8-15 total quality pull-up reps across the week.',
      'Week 4: Test a rested max-quality set, then return to submaximal volume.',
    ]
  }

  if (profile.canHangSeconds >= 25 && profile.negativeSeconds >= 5) {
    return [
      'Week 1: Combine dead hangs, scapular pulls, assisted reps, and 3-5 second negatives.',
      'Week 2: Reduce assistance slightly and add one extra negative per session if elbows feel good.',
      'Week 3: Practice top holds and slow lowers before assisted volume.',
      'Week 4: Test one full pull-up after a rest day, then finish with assisted reps and rows.',
    ]
  }

  return [
    'Week 1: Build grip with short hangs, learn scapular pulls, and row for volume.',
    'Week 2: Add band or foot-assisted pull-up reps if you can hang for 10+ seconds.',
    'Week 3: Introduce controlled negatives only if shoulder position feels stable.',
    'Week 4: Test your best assisted or unassisted rep after a rest day and continue the progression.',
  ]
}

function buildSafetyNotes(profile: PlanProfile) {
  const notes = [
    'Warm up shoulders, elbows, wrists, and upper back before every hanging session.',
    'Stop if pain is sharp, numbness appears, or elbow/shoulder discomfort worsens set to set.',
    'For a one-month pull-up goal, progress depends on current strength, recovery, bodyweight, and consistency; the plan cannot guarantee a first pull-up by a fixed date.',
  ]

  if (profile.condition !== 'healthy' || profile.age >= 50) {
    notes.push('Consider medical or clinician clearance before high-effort hanging, especially with prior shoulder, elbow, wrist, back, or cardiovascular issues.')
  }

  return notes
}

function buildSessions(profile: PlanProfile, library: ExerciseCard[]) {
  const pullUps = library.filter((exercise) => matchesAny(exercise.name, ['pull up', 'pull-up', 'pullup', 'chin', 'dominadas', 'klimm']))
  const rows = library.filter((exercise) => matchesAny(exercise.name, ['row', 'remo', 'rowing']))
  const pulldowns = library.filter((exercise) => matchesAny(exercise.name, ['lat pull', 'front pull', 'pulldown', 'jalón']))

  const pullUpExercise = firstOrFallback(
    pullUps,
    getFallbackExercise('Band-assisted pull-up or foot-assisted pull-up', 'Direct practice for the first pull-up.', ['Pull-up bar', 'Resistance band']),
  )
  const rowExercise = firstOrFallback(
    rows,
    getFallbackExercise('Inverted row or towel row', 'Builds lats and upper-back volume for the pull-up.', ['Sturdy table, rings, TRX, or towel']),
  )
  const pulldownExercise = firstOrFallback(
    pulldowns,
    getFallbackExercise('Band lat pulldown', 'Trains the vertical pulling pattern with lower load.', ['Resistance band']),
  )
  const hangExercise = getFallbackExercise('Dead hang and scapular pull', 'Builds grip, shoulder control, and the bottom pull-up position.', ['Pull-up bar'])
  const negativeExercise = getFallbackExercise('Pull-up negative', 'Builds eccentric strength for the first full rep.', ['Pull-up bar', 'Box or step'])
  const coreExercise = getFallbackExercise('Hollow hold or dead bug', 'Helps keep ribs down and body tight during the pull.', ['Yoga mat'])

  const readiness = getReadinessScore(profile)
  const skillSets = readiness >= 70 ? '5 sets of 1-3 controlled reps or attempts' : readiness >= 40 ? '4 sets of 3-6 assisted reps' : '4 sets of 8-15 second hangs plus 5 scapular pulls'
  const negativePrescription = profile.negativeSeconds >= 5 ? '3-5 negatives with a 5-8 second lower' : '3-4 negatives with a 2-4 second lower or skip if shoulders are not ready'
  const rowPrescription = profile.experience === 'new' ? '3 sets of 8 easy rows' : '4 sets of 8-12 rows'
  const restText = readiness >= 60 ? 'Rest 90-150 seconds between hard sets.' : 'Rest 60-120 seconds and keep every rep smooth.'

  const sessions: WorkoutSession[] = [
    {
      day: 'Day 1',
      focus: 'Pull-up skill and grip',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Warm-up and hang prep',
          prescription: '5-8 minutes of arm circles, band pull-aparts, shoulder blade squeezes, wrist prep, then easy hangs.',
          cue: 'Start every hang with ribs down and shoulders active, not shrugged into your ears.',
          exercises: [hangExercise],
        },
        {
          name: 'Main pull-up practice',
          prescription: `${skillSets}. ${restText}`,
          cue: 'Pull elbows toward your ribs and keep your lower body quiet.',
          exercises: [pullUpExercise],
        },
        {
          name: 'Strength back-off',
          prescription: `${rowPrescription}, then 2 sets of hollow hold or dead bug for 20-30 seconds.`,
          cue: 'Rows should feel strong, not sloppy or jerky.',
          exercises: [rowExercise, coreExercise],
        },
      ],
      note: 'This is the most specific session. Do it after a rest day when possible.',
    },
    {
      day: 'Day 2',
      focus: 'Back volume and shoulder control',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Vertical pulling volume',
          prescription: '3-4 sets of 8-12 controlled reps with a band, cable, or machine if available.',
          cue: 'Initiate by drawing shoulder blades down before bending elbows.',
          exercises: [pulldownExercise],
        },
        {
          name: 'Horizontal pulling',
          prescription: `${rowPrescription} at a difficulty that leaves 2 reps in reserve.`,
          cue: 'Pause briefly with shoulder blades squeezed together.',
          exercises: [rowExercise],
        },
        {
          name: 'Easy conditioning and mobility',
          prescription: '8-15 minutes of relaxed cardio plus chest, lat, and forearm mobility.',
          cue: 'Finish feeling better than when you started.',
          exercises: [],
        },
      ],
      note: 'This day builds the muscle and positions that support the pull-up without maxing out.',
    },
    {
      day: 'Day 3',
      focus: 'Negatives and assisted reps',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Top-position strength',
          prescription: negativePrescription,
          cue: 'Step to the top, hold briefly, lower with control, and stop before elbows get cranky.',
          exercises: [negativeExercise],
        },
        {
          name: 'Assisted pull-up volume',
          prescription: '3-5 sets of 3-6 assisted reps using a band, box, machine, or partner assistance.',
          cue: 'Use just enough assistance to make each rep clean.',
          exercises: [pullUpExercise],
        },
        {
          name: 'Core and recovery',
          prescription: '2-3 rounds of dead bug, side plank from knees, and gentle lat stretching.',
          cue: 'Keep breathing steady and avoid hard bracing if it is not appropriate for your condition.',
          exercises: [coreExercise],
        },
      ],
      note: 'If soreness is high, replace negatives with pulldowns or rows.',
    },
    {
      day: 'Day 4',
      focus: 'Light technique and full-body support',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Easy technique practice',
          prescription: '3 rounds of short active hangs, scapular pulls, and easy assisted reps; keep effort under 6/10.',
          cue: 'This is practice, not a test.',
          exercises: [hangExercise, pullUpExercise],
        },
        {
          name: 'Full-body support',
          prescription: '2-3 rounds of squat or step-up, hip hinge, row, and plank variation.',
          cue: 'Stay balanced so the pull-up work does not overwhelm recovery.',
          exercises: [rowExercise, coreExercise],
        },
      ],
      note: 'Use this only if you recover well from the first three days.',
    },
    {
      day: 'Day 5',
      focus: 'Optional recovery and retest prep',
      duration: `${profile.sessionMinutes} min`,
      blocks: [
        {
          name: 'Recovery circuit',
          prescription: '20-30 minutes easy movement, mobility, and a few short active hangs if they feel good.',
          cue: 'Leave the session fresher than you began.',
          exercises: [hangExercise],
        },
      ],
      note: 'Skip this day if grip, elbows, or shoulders feel under-recovered.',
    },
  ]

  return sessions.slice(0, profile.daysPerWeek)
}

function normalizeProfile(input: PlanProfile): PlanProfile {
  return {
    goal: input.goal?.trim() || 'Do one pull-up in one month',
    gender: input.gender ?? 'prefer-not',
    age: clamp(Number(input.age), 12, 90),
    condition: input.condition ?? 'healthy',
    experience: input.experience ?? 'beginner',
    daysPerWeek: clamp(Number(input.daysPerWeek), 2, 5),
    sessionMinutes: clamp(Number(input.sessionMinutes), 15, 60),
    canHangSeconds: clamp(Number(input.canHangSeconds), 0, 180),
    assistedPullups: clamp(Number(input.assistedPullups), 0, 50),
    negativeSeconds: clamp(Number(input.negativeSeconds), 0, 30),
    currentPullups: clamp(Number(input.currentPullups), 0, 50),
    equipment: Array.isArray(input.equipment) ? input.equipment.filter((item) => typeof item === 'string') : [],
    injuryNotes: input.injuryNotes?.trim() ?? '',
    scheduleNotes: input.scheduleNotes?.trim() ?? '',
  }
}

export default async function createPullUpPlan(req: { params: PlanProfile; user: User }): Promise<PullUpPlan> {
  const profile = normalizeProfile(req.params)

  const response = await workoutApi.rawRequest<WgerExerciseResponse>({
    path: 'exerciseinfo/',
    method: 'GET',
    queryParams: {
      language: '2',
      muscles: '12',
      limit: '80',
    },
  })

  const apiExercises = response.data.results ?? []
  const pullUpCards = selectExercises(apiExercises, ['pull up', 'pull-up', 'pullup', 'chin', 'dominadas', 'klimm'], 'Directly practices the pull-up or a close variation.', 5)
  const rowCards = selectExercises(apiExercises, ['row', 'remo', 'rowing'], 'Builds upper-back and lat strength needed for pull-ups.', 5)
  const pulldownCards = selectExercises(apiExercises, ['lat pull', 'front pull', 'pulldown', 'jalón'], 'Builds the vertical pulling pattern with adjustable assistance.', 5)
  const highScoringCards = apiExercises
    .sort((a, b) => scoreExercise(b) - scoreExercise(a))
    .slice(0, 8)
    .map((exercise) => toExerciseCard(exercise, 'Relevant back and biceps exercise from the workout API.'))

  const exerciseLibrary = uniqueCards([...pullUpCards, ...pulldownCards, ...rowCards, ...highScoringCards]).slice(0, 12)
  const readinessScore = getReadinessScore(profile)
  const sessions = buildSessions(profile, exerciseLibrary)

  return {
    title: profile.currentPullups >= 1 ? 'Four-week pull-up consistency plan' : 'Four-week first pull-up plan',
    summary: `A ${profile.daysPerWeek}-day plan for ${profile.goal}, using ${exerciseLibrary.length} relevant exercises from the workout API and your submitted profile.`,
    timelineWeeks: 4,
    readinessScore,
    apiExerciseCount: response.data.count,
    sessions,
    progression: buildProgression(profile),
    milestones: [
      'End of week 1: Complete all sessions with no shoulder or elbow flare-up the next day.',
      'End of week 2: Add time to your active hang or reduce assistance slightly.',
      'End of week 3: Complete controlled negatives or strong assisted reps without form breakdown.',
      'Week 4 test: After a rest day and warm-up, attempt one pull-up before doing assisted volume.',
    ],
    adaptations: buildAdaptations(profile),
    safetyNotes: buildSafetyNotes(profile),
    exerciseLibrary,
  }
}
