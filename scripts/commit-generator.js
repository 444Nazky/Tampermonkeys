import jsonfile from "jsonfile";
import moment from "moment";
import simpleGit from "simple-git";
import random from "random";

const path = "./data.json";

// Configuration
const START_DATE = "2026-01-03";
const END_DATE = "2026-09-30";
const MIN_COMMITS_PER_DAY = 20;
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

// Create a commit for a specific date
const createCommit = (date, commitCallback) => {
  const data = { date: date.format() };

  jsonfile.writeFile(path, data, () => {
    simpleGit().add([path]).commit(date.format(), { "--date": date.format() }, (err) => {
      if (commitCallback) commitCallback();
    });
  });
};

// Generate commits for each day
const generateCommits = async () => {
  const days = getDaysInRange(START_DATE, END_DATE);
  const totalDays = days.length;
  let currentDayIndex = 0;
  let commitsRemainingForDay = 0;

  console.log(`📅 Generating commits from ${START_DATE} to ${END_DATE}`);
  console.log(`📆 Total days: ${totalDays}`);
  console.log(`🔢 Commits per day: ${MIN_COMMITS_PER_DAY}-${MAX_COMMITS_PER_DAY}`);
  console.log("⏳ Starting commit generation...\n");

  const git = simpleGit();

  // Initial commit to start the repo
  const initialDate = toMoment(START_DATE);
  const initialData = { date: initialDate.format() };

  jsonfile.writeFileSync(path, initialData);
  await git.add([path]);
  await git.commit(initialDate.format(), { "--date": initialDate.format() });

  // Process all days
  for (const day of days) {
    const commitsToday = random.int(MIN_COMMITS_PER_DAY, MAX_COMMITS_PER_DAY);

    console.log(`📆 ${day.format("YYYY-MM-DD")}: ${commitsToday} commits`);

    // Add some hours/minutes variation to commits throughout the day
    for (let i = 0; i < commitsToday; i++) {
      const commitDate = day.clone()
        .hour(random.int(8, 22))  // Between 8 AM and 10 PM
        .minute(random.int(0, 59))
        .second(random.int(0, 59));

      const data = { date: commitDate.format() };

      jsonfile.writeFileSync(path, data);
      await git.add([path]);
      await git.commit(commitDate.format(), { "--date": commitDate.format() });
    }
  }

  // Push all commits
  console.log("\n🚀 Pushing to remote...");
  await git.push();
  console.log("✅ Done! All commits created and pushed.");
};

// Run
generateCommits().catch(console.error);
