export type Gender = 'woman' | 'man' | 'nonbinary' | 'prefer-not'
export type Condition = 'healthy' | 'returning' | 'joint-pain' | 'pregnancy-postpartum' | 'chronic-condition' | 'injury-rehab'
export type Experience = 'new' | 'beginner' | 'intermediate' | 'advanced'

export type WorkoutProfile = {
  gender: Gender
  age: number
  condition: Condition
  experience: Experience
  goal: string
  daysPerWeek: number
  sessionMinutes: number
  currentPushups: number
  equipment: string[]
}

export type PlanBlock = {
  name: string
  prescription: string
  cue: string
}

export type WorkoutSession = {
  day: string
  focus: string
  duration: string
  blocks: PlanBlock[]
  note: string
}

export type GeneratedWorkoutPlan = {
  title: string
  summary: string
  timelineWeeks: number
  intensityPercent: number
  sessions: WorkoutSession[]
  progression: string[]
  milestones: string[]
  adaptations: string[]
  safetyNotes: string[]
}

const conditionLabels: Record<Condition, string> = {
  healthy: 'generally healthy',
  returning: 'returning after a break',
  'joint-pain': 'working around joint pain',
  'pregnancy-postpartum': 'pregnancy or postpartum',
  'chronic-condition': 'managing a chronic condition',
  'injury-rehab': 'recovering from an injury',
}

const experienceLabels: Record<Experience, string> = {
  new: 'brand new',
  beginner: 'beginner',
  intermediate: 'intermediate',
  advanced: 'advanced',
}

function clamp(value: number, min: number, max: number) {
  return Math.min(Math.max(value, min), max)
}

function inferGoal(goal: string) {
  const normalizedGoal = goal.toLowerCase()

  if (normalizedGoal.includes('push')) return 'push-up'
  if (normalizedGoal.includes('pull')) return 'pull-up'
  if (normalizedGoal.includes('run') || normalizedGoal.includes('jog') || normalizedGoal.includes('cardio')) return 'cardio'
  if (normalizedGoal.includes('squat') || normalizedGoal.includes('leg')) return 'lower-body strength'
  if (normalizedGoal.includes('core') || normalizedGoal.includes('plank')) return 'core strength'

  return 'general fitness'
}

function getTrainingAgeMultiplier(experience: Experience) {
  if (experience === 'advanced') return 1.25
  if (experience === 'intermediate') return 1.1
  if (experience === 'beginner') return 0.95
  return 0.8
}

function getConditionMultiplier(condition: Condition) {
  if (condition === 'healthy') return 1
  if (condition === 'returning') return 0.9
  if (condition === 'joint-pain') return 0.75
  if (condition === 'pregnancy-postpartum') return 0.7
  if (condition === 'chronic-condition') return 0.72
  return 0.68
}

function getAgeRecoveryNote(age: number) {
  if (age >= 65) return 'Prioritize controlled tempo, balance support, and 72 hours between harder strength sessions.'
  if (age >= 50) return 'Use a longer warm-up and keep at least 48 hours between challenging push sessions.'
  if (age >= 35) return 'Build steadily and add recovery mobility on non-training days.'
  return 'Progress can be weekly if soreness stays mild and technique remains crisp.'
}

function getPushVariant(profile: WorkoutProfile) {
  if (profile.currentPushups >= 5) return 'standard push-ups'
  if (profile.currentPushups >= 1) return 'single perfect push-ups plus incline volume'
  if (profile.experience === 'new' || profile.condition !== 'healthy') return 'wall or high-counter push-ups'
  return 'incline push-ups on a bench or sturdy counter'
}

function getRepTarget(profile: WorkoutProfile) {
  const baseReps = profile.experience === 'advanced' ? 10 : profile.experience === 'intermediate' ? 8 : 6
  const adjustedReps = Math.round(baseReps * getTrainingAgeMultiplier(profile.experience) * getConditionMultiplier(profile.condition))
  return clamp(adjustedReps, 3, 12)
}

function buildProgression(profile: WorkoutProfile, goalFocus: string) {
  if (goalFocus !== 'push-up') {
    return [
      'Week 1: Learn the movement pattern and stop every set with 2-3 reps in reserve.',
      'Week 2: Add one set or 2 minutes of easy conditioning if recovery is good.',
      'Week 3: Make one exercise slightly harder while keeping form consistent.',
      'Week 4: Retest the goal skill after a full rest day and adjust the next block.',
    ]
  }

  if (profile.currentPushups >= 1) {
    return [
      'Week 1: Practice 3-5 crisp single push-ups across the day, never to failure.',
      'Week 2: Build sets of 2-3 reps, then finish with incline push-up volume.',
      'Week 3: Accumulate 10-20 total standard reps per workout in small sets.',
      'Week 4: Retest with one full-rest max-quality set.',
    ]
  }

  return [
    'Week 1: Wall push-ups, plank holds, and slow lowering practice to build confidence.',
    'Week 2: Lower the incline to a counter or bench when 3 sets feel comfortable.',
    'Week 3: Add knee push-ups or eccentric push-ups with a 3-second lower.',
    'Week 4: Practice one floor push-up attempt after warm-up, then complete incline volume.',
    'Week 5+: Keep lowering the incline until one clean floor push-up is repeatable.',
  ]
}

function buildAdaptations(profile: WorkoutProfile) {
  const adaptations = [
    `This is calibrated for a ${experienceLabels[profile.experience]} trainee who is ${conditionLabels[profile.condition]}.`,
    getAgeRecoveryNote(profile.age),
  ]

  if (profile.gender === 'woman' && profile.age >= 40) {
    adaptations.push('Use strength-focused sets and prioritize protein, sleep, and recovery during hormonal transition years.')
  }

  if (profile.gender === 'man' && profile.age >= 45) {
    adaptations.push('Keep warm-ups deliberate and avoid chasing max reps when shoulders, elbows, or wrists feel stiff.')
  }

  if (profile.gender === 'nonbinary' || profile.gender === 'prefer-not') {
    adaptations.push('Volume is based on current ability and recovery rather than gender assumptions.')
  }

  if (profile.condition === 'joint-pain') {
    adaptations.push('Use elevated hands, neutral wrists on dumbbells or handles, and a pain-free range of motion.')
  }

  if (profile.condition === 'pregnancy-postpartum') {
    adaptations.push('Avoid breath-holding, stop for pelvic pressure or coning, and get clearance before intense core work.')
  }

  if (profile.condition === 'chronic-condition' || profile.condition === 'injury-rehab') {
    adaptations.push('Keep intensity conversational and follow clinician limits for symptoms, range of motion, and impact.')
  }

  if (profile.equipment.length > 0) {
    adaptations.push(`Use available equipment: ${profile.equipment.join(', ')}.`)
  }

  return adaptations
}

function buildSafetyNotes(profile: WorkoutProfile) {
  const notes = [
    'Stop a set if technique breaks, pain rises above mild discomfort, or breathing feels uncontrolled.',
    'Train at an effort of 6-8 out of 10 unless your condition requires a gentler ceiling.',
  ]

  if (profile.age >= 50 || profile.condition !== 'healthy') {
    notes.push('Consider medical clearance before starting or progressing if symptoms are new, worsening, or unexplained.')
  }

  return notes
}

function buildSessions(profile: WorkoutProfile, goalFocus: string) {
  const repTarget = getRepTarget(profile)
  const pushVariant = getPushVariant(profile)
  const warmupMinutes = profile.age >= 50 || profile.condition !== 'healthy' ? 8 : 5
  const conditioningMinutes = clamp(Math.round(profile.sessionMinutes * 0.25), 6, 15)
  const recoveryMinutes = clamp(profile.sessionMinutes - warmupMinutes - 18, 6, 16)

  const pushBlocks: PlanBlock[] = [
    {
      name: `${warmupMinutes}-minute warm-up`,
      prescription: 'March in place, arm circles, shoulder blade squeezes, wrist prep, and easy wall presses.',
      cue: 'You should feel warmer, not tired.',
    },
    {
      name: 'Goal skill practice',
      prescription: `3 sets of ${repTarget} ${pushVariant}, resting 60-90 seconds between sets.`,
      cue: 'Body in one line, hands under shoulders, ribs down.',
    },
    {
      name: 'Support strength',
      prescription: '2-3 rounds: elevated plank 15-30 seconds, band or towel row 8-12 reps, dead bug 6 reps per side.',
      cue: 'Pair pushing with pulling to keep shoulders balanced.',
    },
  ]

  const fullBodyBlocks: PlanBlock[] = [
    {
      name: `${warmupMinutes}-minute mobility prep`,
      prescription: 'Hip hinges, chair squats, cat-cow, easy step-ups, and breathing drills.',
      cue: 'Move smoothly through comfortable ranges.',
    },
    {
      name: 'Full-body base',
      prescription: `2-3 rounds: chair squat ${repTarget + 2} reps, hip hinge ${repTarget + 2} reps, incline push-up ${repTarget} reps, row 8-12 reps.`,
      cue: 'Leave enough energy to repeat the same quality next round.',
    },
    {
      name: 'Easy conditioning',
      prescription: `${conditioningMinutes} minutes of brisk walking, cycling, stairs, or low-impact intervals.`,
      cue: 'You can talk in short sentences the whole time.',
    },
  ]

  const recoveryBlocks: PlanBlock[] = [
    {
      name: 'Recovery circuit',
      prescription: `${recoveryMinutes} minutes of gentle mobility for shoulders, hips, calves, and spine.`,
      cue: 'This session should make tomorrow feel easier.',
    },
    {
      name: 'Core and posture',
      prescription: '2 rounds: bird dog 6 per side, side plank from knees 10-20 seconds, band pull-aparts 10-15 reps.',
      cue: 'Choose pain-free versions and breathe steadily.',
    },
    {
      name: 'Optional easy cardio',
      prescription: `${conditioningMinutes} minutes at relaxed effort if you feel recovered.`,
      cue: 'Skip this if fatigue or soreness is elevated.',
    },
  ]

  const cardioBlocks: PlanBlock[] = [
    {
      name: `${warmupMinutes}-minute ramp`,
      prescription: 'Start with easy walking or cycling, then gradually increase pace.',
      cue: 'No sudden sprinting from cold.',
    },
    {
      name: 'Goal conditioning',
      prescription: goalFocus === 'cardio' ? 'Alternate 1 minute steady effort with 1 minute easy for 10-20 minutes.' : `${conditioningMinutes} minutes of zone-2 cardio.`,
      cue: 'Finish feeling like you could do a little more.',
    },
    {
      name: 'Cool down',
      prescription: '3-5 minutes easy movement plus calf, chest, and hip-flexor mobility.',
      cue: 'Bring breathing back to normal before stopping.',
    },
  ]

  const templates: WorkoutSession[] = [
    {
      day: 'Day 1',
      focus: goalFocus === 'push-up' ? 'Push-up foundation' : 'Goal technique',
      duration: `${profile.sessionMinutes} min`,
      blocks: pushBlocks,
      note: 'Your highest-priority skill goes first while you are fresh.',
    },
    {
      day: 'Day 2',
      focus: 'Full-body strength',
      duration: `${profile.sessionMinutes} min`,
      blocks: fullBodyBlocks,
      note: 'Builds the legs, back, and trunk that support the main goal.',
    },
    {
      day: 'Day 3',
      focus: 'Technique plus core',
      duration: `${profile.sessionMinutes} min`,
      blocks: pushBlocks,
      note: 'Repeat the goal pattern with slightly easier effort than Day 1.',
    },
    {
      day: 'Day 4',
      focus: 'Conditioning and mobility',
      duration: `${profile.sessionMinutes} min`,
      blocks: goalFocus === 'cardio' ? cardioBlocks : recoveryBlocks,
      note: 'Improves work capacity without overloading joints.',
    },
    {
      day: 'Day 5',
      focus: 'Optional practice day',
      duration: `${profile.sessionMinutes} min`,
      blocks: goalFocus === 'cardio' ? cardioBlocks : fullBodyBlocks,
      note: 'Keep this day easy if recovery is not excellent.',
    },
  ]

  return templates.slice(0, profile.daysPerWeek)
}

export function generateWorkoutPlan(profile: WorkoutProfile): GeneratedWorkoutPlan {
  const goalFocus = inferGoal(profile.goal)
  const conditionPenalty = profile.condition === 'healthy' ? 0 : profile.condition === 'returning' ? 1 : 2
  const experiencePenalty = profile.experience === 'new' ? 2 : profile.experience === 'beginner' ? 1 : 0
  const agePenalty = profile.age >= 65 ? 2 : profile.age >= 50 ? 1 : 0
  const pushupBonus = goalFocus === 'push-up' && profile.currentPushups > 0 ? -2 : 0
  const timelineWeeks = clamp(5 + conditionPenalty + experiencePenalty + agePenalty + pushupBonus, 3, 12)
  const intensityPercent = clamp(Math.round(72 * getTrainingAgeMultiplier(profile.experience) * getConditionMultiplier(profile.condition)), 45, 90)

  const title = goalFocus === 'push-up' ? `Path to ${profile.goal || 'your first push-up'}` : `Plan for ${profile.goal || 'your fitness goal'}`
  const summary = `A ${timelineWeeks}-week, ${profile.daysPerWeek}-day plan for a ${profile.age}-year-old ${experienceLabels[profile.experience]} trainee who is ${conditionLabels[profile.condition]}.`

  return {
    title,
    summary,
    timelineWeeks,
    intensityPercent,
    sessions: buildSessions(profile, goalFocus),
    progression: buildProgression(profile, goalFocus),
    milestones: [
      'Week 1: Complete every planned session without next-day symptom flare-ups.',
      'Midpoint: Make one exercise slightly harder or add one controlled rep per set.',
      'Final week: Retest the goal after an easy day and a full warm-up.',
    ],
    adaptations: buildAdaptations(profile),
    safetyNotes: buildSafetyNotes(profile),
  }
}
