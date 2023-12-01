const core = require('@actions/core');
const github = require('@actions/github');
const axios = require('axios')

const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
const octokit = github.getOctokit(GITHUB_TOKEN);

const { context = {} } = github;
const { pull_request } = context.payload;

const main = async () => {
  const res = await axios.post('https://hooks.slack.com/services/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?text=het&channel=tech')
  console.log({ context })
};

main();
