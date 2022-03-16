# {{cookiecutter.repo_name}}
PRs should not be approved without a nice readme entry!

## installation
run the following commands:
```
cd ./infrastructure/azureb2c/
terraform init
terraform apply
```

Then add a line to your core Tiltfile to include this new service:
```
include('./{{cookiecutter.repo_name}}/Tiltfile')
```