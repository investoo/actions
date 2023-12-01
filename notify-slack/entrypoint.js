const core = require('@actions/core');
const github = require('@actions/github');
const axios = require('axios')

const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
const octokit = github.getOctokit(GITHUB_TOKEN);

const { context = {} } = github;
const { pull_request } = context.payload;

const main = async () => {
  // const res = await axios.post('https://offers.igms.io/api/v1/public/visit/1k-daily-profit-crypto-robots?noRedirect=true&channel=crypto&country=DE&language=nl')
  console.log({ context })
};

main();
