# Leovan Finance

Personal finance dashboard, wishlist, goals, and transactions. Vite + Supabase Auth/Database; deployable to Vercel.

## Setup
1. Create/open your Supabase project.
2. In **SQL Editor**, run all of `supabase/schema.sql`.
3. In Supabase **Authentication → URL Configuration**, add your Vercel URL to Site URL and Redirect URLs (also add `http://localhost:5173/**` for local testing).
4. Copy `.env.example` to `.env` and fill `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` (publishable/anon key only).
5. Run `npm install`, then `npm run dev`.
6. For Vercel, import this folder/repository. Build command `npm run build`, output directory `dist`. Add both environment variables in Vercel settings and redeploy.

## Security
- The app uses Supabase Auth and row-level security. Each signed-in user can only read/write their own rows.
- Never put a `service_role` key in the browser or Vercel `VITE_` variables.
- For a private account, disable public signups in Supabase Authentication settings after creating your own account. Password reset emails need the correct Redirect URLs.
- Do not run the SQL on a project with an existing table of the same name if you want a different schema; inspect first.
