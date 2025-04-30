# Resume as Code
This project automates the creation, test, build and upload of my resume using latex, GitHub Actions and terraform. I edit the resume in LaTex format and then create a PR, it then triggers a CI/CD pipeline which tests my resume for spelling mistakes and any broken links. If everything looks good, it triggers the build workflow which builds the resume and then upload it to S3 bucket and also share me a copy through email.

### Quick setup walkthrough
* Any changes in the resume is to be made in resume.tex
* If there are proper nouns, acronyms, or uncommon words, add them to the resume_dict.txt file to avoid false positives during spell check.

### Infrastructure setup
To setup the infra structure 
- navigate to `infra/`
    ```
    cd infra/
    ```
- update the profile name in `providers.tf`  and make sure that the profile has necessary permissions such as creating IAM roles, attaching policies, creating buckets,etc.
- Initialize and apply
    ```
    terraform init
    terraform plan
    terraform apply
    ```
- by default terraform doesn't output the access key and the scecret as they are set as sensitive in outputs.tf, to output the key and secret, run the below commands
    ```
    terraform output -raw github_actions_user_access_key_id
    terraform output -raw github_actions_user_access_key_secret
    ```
- copy the access key and secret. Create a secret in the repository to be able to accessable by GitHub Actions.

### Local build 
To build the resume locally, you can use the scripts inside scripts dir. 
- run setup.sh once to install the necessary dependencies
- run build.sh to build the resume  
Note: This currently supports only debian because we are using apt. Install the necessary dependenices for other distros.
