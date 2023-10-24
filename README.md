# CWProject

I have used the below Push commands for demo-app-ecr-repo:

1) aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 064423548244.dkr.ecr.ap-southeast-2.amazonaws.com
2) docker build -t demo-app-ecr-repo .
3) docker tag demo-app-ecr-repo:latest 064423548244.dkr.ecr.ap-southeast-2.amazonaws.com/demo-app-ecr-repo:latest
4) docker push 064423548244.dkr.ecr.ap-southeast-2.amazonaws.com/demo-app-ecr-repo:latest
