import jsonfile from "jsonfile";
import moment from "moment";
import simpleGit from "simple-git";
import random from "random";

const path = "./data.json";

// Configuration - Jan 1 to Aug 15, 2026, 0-30 commits per day
const START_DATE = "2026-01-01";
const END_DATE = "2026-08-15";
const MIN_COMMITS_PER_DAY = 0;
const MAX_COMMITS_PER_DAY = 30;

// Convert date string to moment
const toMoment = (dateStr) => moment(dateStr, "YYYY-MM-DD");

// Get all days in the range
const getDaysInRange = (start, end) => {
  const days = [];
  let current = toMoment(start);
  const endDate = toMoment(end);

  while (current.isSameOrBefore(endDate)) {
    days.push(current.clone());
    current.add(1, "day");
  }
  return days;
};

// Generate additional commits for each day
const generateCommits = async () => {
  const days = getDaysInRange(START_DATE, END_DATE);
  const totalDays = days.length;

  console.log(`📅 Adding commits from ${START_DATE} to ${END_DATE}`);
  console.log(`📆 Total days: ${totalDays}`);
  console.log(`🔢 Commits per day: ${MIN_COMMITS_PER_DAY}-${MAX_COMMITS_PER_DAY}`);
  console.log("⏳ Starting...\n");

  const git = simpleGit();
  let totalCommits = 0;

  for (const day of days) {
    const commitsToday = random.int(MIN_COMMITS_PER_DAY, MAX_COMMITS_PER_DAY);

    if (commitsToday > 0) {
      totalCommits += commitsToday;
      console.log(`📆 ${day.format("YYYY-MM-DD")}: +${commitsToday} commits`);

      for (let i = 0; i < commitsToday; i++) {
        const commitDate = day.clone()
          .hour(random.int(6, 23))
          .minute(random.int(0, 59))
          .second(random.int(0, 59));

        const data = { date: commitDate.format() };

        jsonfile.writeFileSync(path, data);
        await git.add([path]);
        await git.commit(commitDate.format(), { "--date": commitDate.format() });
      }
    }
  }

  console.log(`\n📊 Total new commits: ${totalCommits}`);
  console.log("🚀 Pushing to remote...");
  await git.push();
  console.log("✅ Done!");
};

// Run
generateCommits().catch(console.error);
