const core = require("@actions/core");
const github = require("@actions/github");
const axios = require("axios");

const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
const WEBHOOK_URL = core.getInput("GITHUB_TOKEN");
const DEPLOYMENT_TARGET = core.getInput("GITHUB_TOKEN");
const DEPLOYMENT_SUCCESSFUL = core.getInput("GITHUB_TOKEN");

const octokit = github.getOctokit(GITHUB_TOKEN);

const { context = {} } = github;
const { pull_request } = context.payload;

const main = async () => {
  console.dir({ context }, { depth: Infinity });
  console.log({
    inputs: {
      WEBHOOK_URL,
      DEPLOYMENT_TARGET,
      DEPLOYMENT_SUCCESSFUL,
    },
  });
  return axios.post(WEBHOOK_URL, {
    text: "het",
  });
};

main();
