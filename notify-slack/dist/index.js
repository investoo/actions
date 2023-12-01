/******/ (() => { // webpackBootstrap
/******/ 	/* webpack/runtime/compat */
/******/ 	
/******/ 	if (typeof __nccwpck_require__ !== 'undefined') __nccwpck_require__.ab = __dirname + "/";
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
const GITHUB_TOKEN = core.getInput("GITHUB_TOKEN");
const octokit = github.getOctokit(GITHUB_TOKEN);

const { context = {} } = github;
const { pull_request } = context.payload;

const main = async () => {
  await octokit.issues.createComment({
    ...context.repo,
    issue_number: pull_request.number,
    body: "Thank you for submitting a pull request! We will try to review this as soon as we can.",
  });
};

main();

module.exports = __webpack_exports__;
/******/ })()
;