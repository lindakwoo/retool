import { useState, type FormEvent, type ReactNode } from 'react'
import { Activity, CalendarDays, Dumbbell, HeartPulse, Loader2, ShieldCheck, Sparkles, Target, TrendingUp, UserRound } from 'lucide-react'

import { Alert, AlertDescription, AlertTitle } from '../lib/shadcn/alert'
import { Badge } from '../lib/shadcn/badge'
import { Button } from '../lib/shadcn/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../lib/shadcn/card'
import { Checkbox } from '../lib/shadcn/checkbox'
import { Input } from '../lib/shadcn/input'
import { Label } from '../lib/shadcn/label'
import { Progress } from '../lib/shadcn/progress'
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '../lib/shadcn/select'
import { Textarea } from '../lib/shadcn/textarea'
import { useCreateWorkoutPlan } from '../hooks/backend/workouts'

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
  goalKind: string
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

const genderOptions: Array<{ value: Gender; label: string }> = [
  { value: 'woman', label: 'Woman' },
  { value: 'man', label: 'Man' },
  { value: 'nonbinary', label: 'Non-binary' },
  { value: 'prefer-not', label: 'Prefer not to say' },
]

const conditionOptions: Array<{ value: Condition; label: string; hint: string }> = [
  { value: 'healthy', label: 'Generally healthy', hint: 'No major limits right now' },
  { value: 'returning', label: 'Returning after a break', hint: 'Detrained or inconsistent recently' },
  { value: 'joint-pain', label: 'Joint pain', hint: 'Wrists, shoulders, knees, hips, or back need care' },
  { value: 'pregnancy-postpartum', label: 'Pregnancy / postpartum', hint: 'Gentler pressure and core management' },
  { value: 'chronic-condition', label: 'Chronic condition', hint: 'Energy, symptoms, or medication may affect training' },
  { value: 'injury-rehab', label: 'Injury rehab', hint: 'Working within clinician guidance' },
]

const experienceOptions: Array<{ value: Experience; label: string }> = [
  { value: 'new', label: 'New to exercise' },
  { value: 'beginner', label: 'Beginner' },
  { value: 'intermediate', label: 'Intermediate' },
  { value: 'advanced', label: 'Advanced' },
]

const equipmentOptions = [
  'Pull-up bar',
  'Resistance band',
  'Running shoes',
  'Pool access',
  'Bike',
  'Dumbbells',
  'Gym/cable machine',
  'Yoga mat',
  'Sturdy chair/table',
  'Bench',
  'Barbell',
  'Kettlebell',
  'Swiss Ball',
]

const starterProfile: PlanProfile = {
  goal: 'Do one pull-up in one month',
  currentAbility: 'I can hang for 10 seconds but cannot do a pull-up yet.',
  age: 32,
  gender: 'prefer-not',
  condition: 'healthy',
  experience: 'beginner',
  daysPerWeek: 3,
  sessionMinutes: 30,
  timelineWeeks: 4,
  equipment: ['Pull-up bar', 'Resistance band'],
  injuryNotes: '',
  scheduleNotes: 'Prefer Monday, Wednesday, Friday.',
}

function FieldShell({ icon: Icon, title, children }: { icon: typeof UserRound; title: string; children: ReactNode }) {
  return (
    <div className="space-y-2">
      <div className="flex items-center gap-2">
        <Icon className="h-4 w-4 text-muted-foreground" />
        <Label className="text-sm font-semibold">{title}</Label>
      </div>
      {children}
    </div>
  )
}

function clampNumber(value: number, min: number, max: number) {
  if (Number.isNaN(value)) return min
  return Math.min(Math.max(value, min), max)
}

function PlanPlaceholder() {
  return (
    <Card className="border-dashed">
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Sparkles className="h-5 w-5 text-primary" />
          Submit your details to generate a plan
        </CardTitle>
        <CardDescription>
          Enter any goal, such as “one pull-up,” “run 5 miles,” “swim half a mile,” “hold a 2-minute plank,” or “build leg strength.”
        </CardDescription>
      </CardHeader>
      <CardContent className="grid gap-3 text-sm text-muted-foreground sm:grid-cols-3">
        <div className="rounded-lg border bg-card p-3">1. The app classifies your goal.</div>
        <div className="rounded-lg border bg-card p-3">2. It pulls related exercises from your workout API.</div>
        <div className="rounded-lg border bg-card p-3">3. It creates a progression from your profile.</div>
      </CardContent>
    </Card>
  )
}

function ExercisePill({ exercise }: { exercise: ExerciseCard }) {
  return (
    <div className="rounded-lg border bg-card p-3">
      <div className="flex gap-3">
        {exercise.imageUrl ? (
          <img src={exercise.imageUrl} alt={exercise.name} className="h-14 w-14 rounded-md border object-cover" />
        ) : (
          <div className="flex h-14 w-14 shrink-0 items-center justify-center rounded-md border bg-secondary">
            <Dumbbell className="h-5 w-5 text-muted-foreground" />
          </div>
        )}
        <div className="min-w-0 space-y-1">
          <div className="font-semibold leading-tight">{exercise.name}</div>
          <p className="text-xs text-muted-foreground">{exercise.reason}</p>
          <div className="flex flex-wrap gap-1">
            <Badge variant="secondary" className="text-[10px]">{exercise.category}</Badge>
            <Badge variant="outline" className="text-[10px]">{exercise.source}</Badge>
          </div>
          <p className="text-xs text-muted-foreground">
            Required: {exercise.requiredEquipment.length > 0 ? exercise.requiredEquipment.join(', ') : 'No equipment'}
          </p>
        </div>
      </div>

      <div className="mt-3 space-y-3 border-t pt-3">
        <div>
          <div className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">How to do it</div>
          <ol className="mt-2 space-y-1.5 pl-5 text-sm text-muted-foreground">
            {exercise.instructions.map((instruction, index) => (
              <li key={`${exercise.id}-instruction-${index}`} className="list-decimal">{instruction}</li>
            ))}
          </ol>
        </div>

        <div className="rounded-md bg-secondary p-3">
          <div className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Modify</div>
          <p className="mt-1 text-sm text-secondary-foreground">{exercise.modification}</p>
        </div>

        <div>
          <div className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Avoid</div>
          <ul className="mt-2 space-y-1 text-sm text-muted-foreground">
            {exercise.commonMistakes.map((mistake, index) => (
              <li key={`${exercise.id}-mistake-${index}`}>• {mistake}</li>
            ))}
          </ul>
        </div>
      </div>
    </div>
  )
}

export default function WorkoutPlanner() {
  const [profile, setProfile] = useState<PlanProfile>(starterProfile)
  const { data, loading, error, trigger } = useCreateWorkoutPlan()
  const plan = data as WorkoutPlan | null
  const selectedCondition = conditionOptions.find((option) => option.value === profile.condition)

  const updateProfile = <Key extends keyof PlanProfile>(key: Key, value: PlanProfile[Key]) => {
    setProfile((current) => ({ ...current, [key]: value }))
  }

  const toggleEquipment = (item: string) => {
    setProfile((current) => {
      const equipment = current.equipment.includes(item)
        ? current.equipment.filter((selected) => selected !== item)
        : [...current.equipment, item]

      return { ...current, equipment }
    })
  }

  const handleSubmit = (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault()
    trigger(profile, { skipCache: true })
  }

  const tryExample = (goal: string, currentAbility: string, equipment: string[], timelineWeeks: number) => {
    setProfile((current) => ({
      ...current,
      goal,
      currentAbility,
      equipment,
      timelineWeeks,
      daysPerWeek: goal.includes('swim') ? 4 : current.daysPerWeek,
      sessionMinutes: goal.includes('5 miles') ? 40 : current.sessionMinutes,
    }))
  }

  return (
    <main className="min-h-screen bg-background text-foreground">
      <section className="border-b bg-card/60">
        <div className="mx-auto grid max-w-7xl gap-8 px-4 py-8 sm:px-6 lg:grid-cols-[1fr_360px] lg:px-8 lg:py-10">
          <div className="space-y-5">
            <Badge variant="secondary" className="w-fit gap-2">
              <Dumbbell className="h-3.5 w-3.5" />
              Workout API powered planner
            </Badge>
            <div className="space-y-3">
              <h1 className="max-w-3xl text-4xl font-bold tracking-tight sm:text-5xl">
                Submit any fitness goal and get a personalized training plan.
              </h1>
              <p className="max-w-2xl text-lg text-muted-foreground">
                Tell me your goal, current ability, schedule, equipment, and limitations. The app uses your workout API’s exerciseinfo endpoint to pick related exercises and build a progression.
              </p>
            </div>
            <div className="flex flex-wrap gap-2">
              <Button type="button" variant="outline" size="sm" onClick={() => tryExample('Do one pull-up in one month', 'I can hang for 10 seconds but cannot do a pull-up yet.', ['Pull-up bar', 'Resistance band'], 4)}>
                Pull-up example
              </Button>
              <Button type="button" variant="outline" size="sm" onClick={() => tryExample('Run 5 miles', 'I can run 1 mile slowly and walk 3 miles.', ['Running shoes'], 8)}>
                Run example
              </Button>
              <Button type="button" variant="outline" size="sm" onClick={() => tryExample('Swim half a mile', 'I can swim 4 easy laps with rest breaks.', ['Pool access'], 8)}>
                Swim example
              </Button>
            </div>
          </div>

          <Card className="h-fit">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-xl">
                <Target className="h-5 w-5 text-primary" />
                Plan status
              </CardTitle>
              <CardDescription>{plan ? plan.summary : 'Ready when you submit your profile.'}</CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div>
                <div className="mb-2 flex items-center justify-between text-sm">
                  <span className="text-muted-foreground">Readiness score</span>
                  <span className="font-semibold">{plan ? `${plan.readinessScore}%` : '—'}</span>
                </div>
                <Progress value={plan?.readinessScore ?? 0} />
              </div>
              <div className="grid grid-cols-3 gap-3 text-center">
                <div className="rounded-lg border bg-background p-3">
                  <div className="text-2xl font-bold">{profile.timelineWeeks}</div>
                  <div className="text-xs text-muted-foreground">weeks</div>
                </div>
                <div className="rounded-lg border bg-background p-3">
                  <div className="text-2xl font-bold">{profile.daysPerWeek}</div>
                  <div className="text-xs text-muted-foreground">days/wk</div>
                </div>
                <div className="rounded-lg border bg-background p-3">
                  <div className="text-2xl font-bold">{plan?.exerciseLibrary.length ?? 0}</div>
                  <div className="text-xs text-muted-foreground">API picks</div>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>
      </section>

      <section className="mx-auto grid max-w-7xl gap-6 px-4 py-6 sm:px-6 lg:grid-cols-[410px_1fr] lg:px-8">
        <Card className="h-fit lg:sticky lg:top-6">
          <CardHeader>
            <CardTitle>Submit your information</CardTitle>
            <CardDescription>The more specific you are, the better the plan can be.</CardDescription>
          </CardHeader>
          <CardContent>
            <form className="space-y-5" onSubmit={handleSubmit}>
              <FieldShell icon={Target} title="Goal">
                <Textarea
                  value={profile.goal}
                  onChange={(event) => updateProfile('goal', event.target.value)}
                  placeholder="e.g., one pull-up, run 5 miles, swim half a mile"
                  className="min-h-20"
                />
              </FieldShell>

              <FieldShell icon={Activity} title="Current ability / baseline">
                <Textarea
                  value={profile.currentAbility}
                  onChange={(event) => updateProfile('currentAbility', event.target.value)}
                  placeholder="What can you do now? Include distances, reps, pace, rest breaks, or symptoms."
                  className="min-h-24"
                />
              </FieldShell>

              <div className="grid grid-cols-2 gap-4">
                <FieldShell icon={UserRound} title="Age">
                  <Input type="number" min={12} max={90} value={profile.age} onChange={(event) => updateProfile('age', clampNumber(Number(event.target.value), 12, 90))} />
                </FieldShell>
                <FieldShell icon={CalendarDays} title="Weeks">
                  <Input type="number" min={1} max={24} value={profile.timelineWeeks} onChange={(event) => updateProfile('timelineWeeks', clampNumber(Number(event.target.value), 1, 24))} />
                </FieldShell>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <FieldShell icon={CalendarDays} title="Days / week">
                  <Select value={String(profile.daysPerWeek)} onValueChange={(value) => updateProfile('daysPerWeek', Number(value))}>
                    <SelectTrigger><SelectValue /></SelectTrigger>
                    <SelectContent>
                      {[2, 3, 4, 5, 6].map((day) => <SelectItem key={day} value={String(day)}>{day} days</SelectItem>)}
                    </SelectContent>
                  </Select>
                </FieldShell>
                <FieldShell icon={CalendarDays} title="Minutes">
                  <Select value={String(profile.sessionMinutes)} onValueChange={(value) => updateProfile('sessionMinutes', Number(value))}>
                    <SelectTrigger><SelectValue /></SelectTrigger>
                    <SelectContent>
                      {[15, 20, 30, 40, 60, 75, 90].map((minutes) => <SelectItem key={minutes} value={String(minutes)}>{minutes} min</SelectItem>)}
                    </SelectContent>
                  </Select>
                </FieldShell>
              </div>

              <FieldShell icon={UserRound} title="Gender">
                <Select value={profile.gender} onValueChange={(value) => updateProfile('gender', value as Gender)}>
                  <SelectTrigger><SelectValue /></SelectTrigger>
                  <SelectContent>{genderOptions.map((option) => <SelectItem key={option.value} value={option.value}>{option.label}</SelectItem>)}</SelectContent>
                </Select>
              </FieldShell>

              <FieldShell icon={HeartPulse} title="Condition">
                <Select value={profile.condition} onValueChange={(value) => updateProfile('condition', value as Condition)}>
                  <SelectTrigger><SelectValue /></SelectTrigger>
                  <SelectContent>{conditionOptions.map((option) => <SelectItem key={option.value} value={option.value}>{option.label}</SelectItem>)}</SelectContent>
                </Select>
                {selectedCondition ? <p className="text-xs text-muted-foreground">{selectedCondition.hint}</p> : null}
              </FieldShell>

              <FieldShell icon={TrendingUp} title="Experience">
                <Select value={profile.experience} onValueChange={(value) => updateProfile('experience', value as Experience)}>
                  <SelectTrigger><SelectValue /></SelectTrigger>
                  <SelectContent>{experienceOptions.map((option) => <SelectItem key={option.value} value={option.value}>{option.label}</SelectItem>)}</SelectContent>
                </Select>
              </FieldShell>

              <div className="space-y-3">
                <Label className="flex items-center gap-2 font-semibold"><Dumbbell className="h-4 w-4 text-muted-foreground" />Equipment / access</Label>
                <div className="grid gap-2 sm:grid-cols-2">
                  {equipmentOptions.map((item) => (
                    <label key={item} className="flex cursor-pointer items-center gap-3 rounded-md border bg-background p-3 text-sm hover:bg-accent">
                      <Checkbox checked={profile.equipment.includes(item)} onCheckedChange={() => toggleEquipment(item)} />
                      {item}
                    </label>
                  ))}
                </div>
              </div>

              <FieldShell icon={ShieldCheck} title="Injuries, symptoms, or limitations">
                <Textarea value={profile.injuryNotes} onChange={(event) => updateProfile('injuryNotes', event.target.value)} placeholder="Optional, but important for safety and modifications." />
              </FieldShell>

              <FieldShell icon={CalendarDays} title="Schedule preferences">
                <Textarea value={profile.scheduleNotes} onChange={(event) => updateProfile('scheduleNotes', event.target.value)} placeholder="Preferred days, rest days, travel, time constraints, etc." />
              </FieldShell>

              <Button type="submit" className="w-full" disabled={loading || profile.goal.trim().length === 0}>
                {loading ? <Loader2 className="mr-2 h-4 w-4 animate-spin" /> : <Sparkles className="mr-2 h-4 w-4" />}
                Generate my plan
              </Button>
            </form>
          </CardContent>
        </Card>

        <div className="space-y-6">
          {error ? (
            <Alert variant="destructive">
              <ShieldCheck className="h-4 w-4" />
              <AlertTitle>Could not generate plan</AlertTitle>
              <AlertDescription>{error}</AlertDescription>
            </Alert>
          ) : null}

          {!plan ? <PlanPlaceholder /> : (
            <>
              <Card>
                <CardHeader>
                  <div className="flex flex-col gap-3 sm:flex-row sm:items-start sm:justify-between">
                    <div>
                      <CardTitle>{plan.title}</CardTitle>
                      <CardDescription>{plan.summary}</CardDescription>
                    </div>
                    <Badge className="w-fit capitalize">{plan.goalKind}</Badge>
                  </div>
                </CardHeader>
                <CardContent className="grid gap-4 md:grid-cols-2">
                  {plan.sessions.map((session, sessionIndex) => (
                    <div key={session.day} className={`rounded-xl border bg-background p-4 ${sessionIndex === 0 ? 'md:col-span-2' : ''}`}>
                      <div className="mb-4 flex items-start justify-between gap-3">
                        <div>
                          <div className="text-sm font-semibold text-muted-foreground">{session.day} · {session.duration}</div>
                          <h3 className="text-xl font-semibold">{session.focus}</h3>
                        </div>
                        <CalendarDays className="h-5 w-5 text-primary" />
                      </div>
                      <div className="space-y-3">
                        {session.blocks.map((block) => (
                          <div key={block.name} className="rounded-lg border bg-card p-3">
                            <div className="font-semibold">{block.name}</div>
                            <p className="mt-1 text-sm text-muted-foreground">{block.prescription}</p>
                            <p className="mt-2 text-xs font-medium text-foreground">Cue: {block.cue}</p>
                            {block.exercises.length > 0 ? (
                              <div className="mt-3 grid gap-2">
                                {block.exercises.map((exercise) => <ExercisePill key={`${block.name}-${exercise.id}`} exercise={exercise} />)}
                              </div>
                            ) : null}
                          </div>
                        ))}
                      </div>
                      <p className="mt-3 text-sm text-muted-foreground">{session.note}</p>
                    </div>
                  ))}
                </CardContent>
              </Card>

              <div className="grid gap-6 lg:grid-cols-2">
                <Card>
                  <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-xl"><TrendingUp className="h-5 w-5 text-primary" />Progression</CardTitle>
                    <CardDescription>Advance only when the current level feels controlled.</CardDescription>
                  </CardHeader>
                  <CardContent className="space-y-3">
                    {plan.progression.map((step, index) => (
                      <div key={step} className="flex gap-3 rounded-lg border bg-background p-3">
                        <div className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-primary text-sm font-bold text-primary-foreground">{index + 1}</div>
                        <p className="text-sm text-muted-foreground">{step}</p>
                      </div>
                    ))}
                  </CardContent>
                </Card>

                <Card>
                  <CardHeader>
                    <CardTitle className="flex items-center gap-2 text-xl"><ShieldCheck className="h-5 w-5 text-primary" />Adaptations & safety</CardTitle>
                    <CardDescription>Based on your profile, condition, and schedule.</CardDescription>
                  </CardHeader>
                  <CardContent className="space-y-4">
                    <div className="space-y-2">
                      {plan.adaptations.map((adaptation) => <p key={adaptation} className="rounded-lg border bg-background p-3 text-sm text-muted-foreground">{adaptation}</p>)}
                    </div>
                    <div className="rounded-lg border bg-secondary p-4">
                      <div className="mb-2 font-semibold">Safety notes</div>
                      <ul className="space-y-2 text-sm text-muted-foreground">
                        {plan.safetyNotes.map((note) => <li key={note}>• {note}</li>)}
                      </ul>
                    </div>
                  </CardContent>
                </Card>
              </div>

              <Card>
                <CardHeader>
                  <CardTitle>Exercise library from workout API</CardTitle>
                  <CardDescription>{plan.apiExerciseCount} related API records were available for this goal category.</CardDescription>
                </CardHeader>
                <CardContent className="grid gap-3 md:grid-cols-2 xl:grid-cols-3">
                  {plan.exerciseLibrary.map((exercise) => <ExercisePill key={exercise.id} exercise={exercise} />)}
                </CardContent>
              </Card>
            </>
          )}
        </div>
      </section>
    </main>
  )
}
