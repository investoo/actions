const core = require('@actions/core');
const github = require('@actions/github');
const axios = require('axios')

const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
const octokit = github.getOctokit(GITHUB_TOKEN);

const { context = {} } = github;
const { pull_request } = context.payload;

const main = async () => {
  console.log({ context })
};

main();
