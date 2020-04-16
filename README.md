# actions
> A repository containing our Github Actions

#### Deploy
* [Client](#deploy-client)
* [Function](#deploy-function)
* [Library](#deploy-library)
* [Package](#deploy-package)
* [Service](#deploy-service)

#### Miscellaneous
* [Notify Slack](#notify-slack)
* [Test](#test)
* [Validate Version](#validate-version)

---

## Deploy Client
This Action will install NPM dependencies, run the build command, and finally deploy the app to Firebase.

### Env Variables

| Name | Type | Description |
| --- | --- | --- |
| `GH_PROJECT_NAME` | String | **REQUIRED** The name of the repository. Can be accessed via `github.event.repository.name`. |
| `DEPLOY_ENV` | String | **REQUIRED** Deployment target. Options are `staging` or `prod`. |
| `BUILD_MODE` | String | The mode passed to the `--mode` flag during `npm run build` |
| `GCLOUD_PROJECT_ID` | String | **REQUIRED** ID of the Google Cloud Project |
| `NPM_TOKEN` | String | **REQUIRED** Github access token, to install private registry packages |
| `FIREBASE_TOKEN` | String | **REQUIRED** Firebase Token, to allow deployment |

### Usage: 
```yml
  ...
  - uses: investoo/actions/deploy/client@master
    name: Deploy
    env:
      GH_PROJECT_NAME: ${{ github.event.repository.name }}
      DEPLOY_ENV: prod
      BUILD_MODE: production
      GCLOUD_PROJECT_ID: tech-microservices-production
      NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
      OTHER_ENV_KEYS: here
  ...
```

---

## Deploy Function
This Action will install NPM dependencies and deploy the app to Google Cloud Functions.

### Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `GCLOUD_ZONE` | String | europe-west2-a | Default region or zone |
| `ENTRY_POINT` | String | handle | Entrypoint function to be invoked |
| `RUNTIME` | String | nodejs8 | Runtime environment that the function runs in |
| `REGION` | String | europe-west2 | Deployment region |
| `MEMORY` | String | 128MB | Memory to allocate the function |
| `TRIGGER` | String | HTTP | What type of event triggers the function? Options are `TOPIC` and `HTTP` |
| `TRIGGER_TOPIC` | String \| Boolean | false | What topic triggers the function? Only required if `TRIGGER` is set to `TOPIC` |

### Env Variables

| Name | Type | Description |
| --- | --- | --- |
| `GH_PROJECT_NAME` | String | **REQUIRED** The name of the repository. Can be accessed via `github.event.repository.name`. |
| `NPM_TOKEN` | String | **REQUIRED** Github access token, to install private registry packages |
| `GCLOUD_PROJECT_ID` | String | **REQUIRED** ID of the Google Cloud Project |
| `GCLOUD_SERVICE_KEY` | String | **REQUIRED** Base64-encoded Google Cloud Service Key  |

### Usage: 
```yml
  ...
  - uses: investoo/actions/deploy/function@master
    name: Deploy
    with:
      GCLOUD_ZONE: europe-west2-a
      ENTRY_POINT: handle
      RUNTIME: nodejs8
      REGION: europe-west2
      MEMORY: 128MB
      TRIGGER: HTTP
      TRIGGER_TOPIC: false
    env:
      GH_PROJECT_NAME: ${{ github.event.repository.name }}
      NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      GCLOUD_PROJECT_ID: tech-microservices-staging
      GCLOUD_SERVICE_KEY: ${{ secrets.GCLOUD_SERVICE_KEY_STAGING }}
      OTHER_ENV_KEYS: here
```

---

## Deploy Library
This Action will install NPM dependencies, upload files to a Google Cloud Bucket, and optionally publish to the NPM registry

### Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `PUBLISH_PACKAGE` | Boolean | false | Should the package be published to the NPM registry? |
| `GCLOUD_BUCKET_NAME` | String |  | **REQUIRED** Bucket name to upload library to |
| `GCLOUD_ZONE` | Boolean | europe-west2-a | Default region or zone |

### Env Variables

| Name | Type | Description |
| --- | --- | --- |
| `GH_PROJECT_NAME` | String | **REQUIRED** The name of the repository. Can be accessed via `github.event.repository.name`. |
| `NPM_TOKEN` | String | **REQUIRED** Github access token, to install private registry packages |
| `GCLOUD_SERVICE_KEY` | String | **REQUIRED** ID of the Google Cloud Project |
| `GCLOUD_PROJECT_ID` | String | **REQUIRED** ID of the Google Cloud Project |

### Usage: 
```yml
  ...
  - uses: investoo/actions/deploy/library@master
    name: Deploy
    with:
      GCLOUD_BUCKET_NAME: static-staging.igms.io
      GCLOUD_ZONE: europe-west2-a
    env:
      GH_PROJECT_NAME: ${{ github.event.repository.name }}
      NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      GCLOUD_PROJECT_ID: tech-microservices-staging
      GCLOUD_SERVICE_KEY: ${{ secrets.GCLOUD_SERVICE_KEY_STAGING }}
      OTHER_ENV_KEYS: here
```

---

## Deploy Package
This Action will install NPM dependencies, and publish to the NPM registry

### Env Variables

| Name | Type | Description |
| --- | --- | --- |
| `GH_PROJECT_NAME` | String | **REQUIRED** The name of the repository. Can be accessed via `github.event.repository.name`. |
| `NPM_TOKEN` | String | **REQUIRED** Github access token, to install private registry packages |
| `GCLOUD_SERVICE_KEY` | String | **REQUIRED** ID of the Google Cloud Project |
| `GCLOUD_PROJECT_ID` | String | **REQUIRED** ID of the Google Cloud Project |


### Usage: 
```yml
  ...
  - uses: investoo/actions/deploy/package@master
    name: Deploy
    env:
      NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      OTHER_ENV_KEYS: here
```

---

## Deploy Service
This Action will install NPM dependencies, build the project, and deploy it to Google AppEngine

**NOTE**
Deploying a service also deploys the `dispatch.yml` found within this project. This sets our routing rules. If you are deploying a *NEW* service to AppEngine, you'll need to update the `dispatch/prod.yml` and `dispatch/staging.yml` files as well.

### Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `DEPLOY_ENV` | String |  | **REQUIRED** Environemnt to deploy to. Should be either `prod` or `staging` |
| `GCLOUD_ZONE` | Boolean | europe-west2-a | Default region or zone |

### Env Variables

| Name | Type | Description |
| --- | --- | --- |
| `NPM_TOKEN` | String | **REQUIRED** Github access token, to install private registry packages |

### Usage: 
This Action requires the service to have a `deploy` directory, and `prod` and `staging` directories within that. Both of these child directories shoul have an `app.yml` inside, to tell AppEngine the deployment configuration.

For example, in your `deploy/staging/app.yml`:
```yml
runtime: nodejs10
service: ${GH_PROJECT_NAME}

env_variables:
  NODE_ENV: staging
  OTHER_KEY: '${OTHER_ENV_KEYS}'

resources:
  cpu: 2
  memory_gb: 5

network:
  name: default

automatic_scaling:
  min_num_instances: 3
  max_num_instances: 10
  cool_down_period_sec: 180
```

And in your workflow file:

```yml
  ...
  - uses: investoo/actions/deploy/service@master
    name: Deploy
    with:
      DEPLOY_ENV: staging
    env:
      NPM_TOKEN: ${{ secrets.NPM_TOKEN }}
      OTHER_ENV_KEYS: mapped
```

---

## Notify Slack
This action will send a pre-formatted message via the Slack webhook URL that is provided. To grab the success state of the previous step, a job will need to be run within your workflow to make that information accessible to this action. You want this action to run `if: always()`, to prevent the workflow being short-circuited.

### Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `DEPLOYMENT_TARGET` | String |  | **REQUIRED** Environment that deployment was attempted. Should be either `Production` or `Staging` |
| `DEPLOYMENT_SUCCESSFUL` | Boolean | false | Was the deployment a success? |
| `WEBHOOK_URL` | String |  | **REQUIRED** Slack Webhook URL |

### Usage

```yml
  ...
  - name: Record Deployment Result
    if: always()
    run: |
      SUCCESS=false; [ ${{ job.status }} = Success ] && SUCCESS=true
      echo ::set-env name=DEPLOYMENT_SUCCESSFUL::$SUCCESS
  - uses: investoo/actions/notify-slack@master
    if: always()
    name: Send deployment result to Slack
    with:
      DEPLOYMENT_TARGET: Staging
      DEPLOYMENT_SUCCESSFUL: ${{ env.DEPLOYMENT_SUCCESSFUL }}
      WEBHOOK_URL: ${{ secrets.WEBHOOK_URL_SLACK }}
```

---

## Test
This action will run the tests in your project. Failing tests will fail the check.

### Inputs

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `NEEDS_DOCKER` | boolean | false | Should the tests be run in a docker environment? |

### Usage

```yml
  ...
  - uses: investoo/actions/test@master
    name: Run Tests
    with:
      NEEDS_DOCKER: true
    env:
      ANY_OTHER: env
      VARS: here
```

---

## Validate Version
This action will compare the package.json version number from master against your branch. If the master branch version is the same or higher, the check will fail.

### Usage

```yml
  ...
  - uses: investoo/actions/validate-version@master
    name: Validate Package Version
```