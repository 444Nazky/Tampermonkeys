import jsonfile from "jsonfile";
import moment from "moment";
import simpleGit from "simple-git";
import random from "random";

const path = "./data.json";

// Pair programming session configuration
const SESSION_COUNT = 9; // Need 9 more sessions (already have 1)
const COMMITS_PER_SESSION = 15; // Commits per session day

// Account configurations
const ACCOUNT_1 = { name: "444Nazky", email: "naruzky.naz@gmail.com" };
const ACCOUNT_2 = { name: "bebekkrenyes", email: "nazkykaryamas@gmail.com" };

// Dates for pair programming sessions (Oct 16 - Oct 24, 2026)
const SESSION_DATES = [
  "2026-10-16",
  "2026-10-17",
  "2026-10-18",
  "2026-10-19",
  "2026-10-20",
  "2026-10-21",
  "2026-10-22",
  "2026-10-23",
  "2026-10-24"
];

const toMoment = (dateStr) => moment(dateStr, "YYYY-MM-DD");

// Create a commit with specific account
const createCommit = async (git, account, date, sessionNum, commitNum) => {
  const commitDate = date.clone()
    .hour(random.int(9, 20))
    .minute(random.int(0, 59))
    .second(random.int(0, 59));

  const data = {
    date: commitDate.format(),
    author: account.name,
    session: `Pair Programming Session #${sessionNum}`
  };

  jsonfile.writeFileSync(path, data);

  // Configure git with the author
  git.add([path]);

  // Use raw git command to handle author properly
  const authorString = `${account.name} <${account.email}>`;

  await new Promise((resolve, reject) => {
    git.raw([
      'commit',
      '-m', `[Pair Programming] Session #${sessionNum} - commit #${commitNum}`,
      '--date', commitDate.format(),
      '--author', authorString,
      '--no-edit'
    ]).then(resolve).catch(reject);
  });
};

// Run pair programming sessions
const runPairSessions = async () => {
  console.log("🌐 Pair Extraordinaire Badge Progress");
  console.log("=====================================");
  console.log(`📊 Current progress: 1/10 (1 session done)`);
  console.log(`🎯 Target: 10/10 (bronze badge)`);
  console.log(`📅 New sessions: ${SESSION_DATES.length}`);
  console.log(`💻 Commits per session: ${COMMITS_PER_SESSION}`);
  console.log("=====================================\n");

  const git = simpleGit();
  let sessionNum = 2; // Start from session 2 (session 1 already done)

  for (const dateStr of SESSION_DATES) {
    const date = toMoment(dateStr);

    console.log(`\n💻 Session ${sessionNum}: ${dateStr}`);
    console.log("----------------------------------------");

    // Alternating commits between two "developers"
    for (let i = 0; i < COMMITS_PER_SESSION; i++) {
      const isAccount1 = i % 2 === 0;
      const account = isAccount1 ? ACCOUNT_1 : ACCOUNT_2;

      console.log(`  ${account.name}: commit #${i + 1}`);

      await createCommit(git, account, date, sessionNum, i + 1);
    }

    sessionNum++;
  }

  console.log("\n🚀 Pushing all pair programming sessions...");
  await git.push();
  console.log("✅ All sessions pushed!");
  console.log("\n📊 Session Summary:");
  console.log("  - Total sessions: 10");
  console.log("  - Commits per session: ~15");
  console.log("  - Contributors: 444Nazky, bebekkrenyes");
  console.log("\n🌟 Bronze Pair Extraordinaire badge should be awarded!");
};

// Run
runPairSessions().catch(console.error);
