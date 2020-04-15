# actions
> A repository containing our Github Actions
---
## Action List

#### Deploy
* [Client](#deploy-client)
* [Function](#deploy-function)
* [Library](#deploy-library)
* [Package](#deploy-package)
* [Service](#deploy-service)
* [Library](#deploy-library)

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
```