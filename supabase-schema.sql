-- WEB GURU AI V3 - starter schema untuk Supabase
create table if not exists public.teacher_profiles (
 id uuid primary key references auth.users(id) on delete cascade,
 full_name text, school_name text, subject_name text,
 created_at timestamptz default now()
);

create table if not exists public.students (
 id uuid primary key default gen_random_uuid(),
 teacher_id uuid not null references auth.users(id) on delete cascade,
 nis text not null, name text not null, class_name text not null,
 gender text check (gender in ('L','P')),
 created_at timestamptz default now(),
 unique(teacher_id, nis)
);

create table if not exists public.attendance (
 id uuid primary key default gen_random_uuid(),
 teacher_id uuid not null references auth.users(id) on delete cascade,
 student_id uuid not null references public.students(id) on delete cascade,
 attendance_date date not null,
 status text not null check(status in ('Hadir','Izin','Sakit','Alpa')),
 note text, created_at timestamptz default now(),
 unique(student_id, attendance_date)
);

create table if not exists public.scores (
 id uuid primary key default gen_random_uuid(),
 teacher_id uuid not null references auth.users(id) on delete cascade,
 student_id uuid not null references public.students(id) on delete cascade,
 assessment_type text not null,
 score numeric(5,2) not null check(score between 0 and 100),
 created_at timestamptz default now()
);

alter table public.teacher_profiles enable row level security;
alter table public.students enable row level security;
alter table public.attendance enable row level security;
alter table public.scores enable row level security;

create policy "own teacher profile" on public.teacher_profiles
for all using(auth.uid()=id) with check(auth.uid()=id);

create policy "own students" on public.students
for all using(auth.uid()=teacher_id) with check(auth.uid()=teacher_id);

create policy "own attendance" on public.attendance
for all using(auth.uid()=teacher_id) with check(auth.uid()=teacher_id);

create policy "own scores" on public.scores
for all using(auth.uid()=teacher_id) with check(auth.uid()=teacher_id);
