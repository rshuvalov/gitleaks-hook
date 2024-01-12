Enable gitleaks:
```
mv .git/hooks/pre-commit.sample .git/hooks/pre-commit && \
printf "curl https://raw.githubusercontent.com/rshuvalov/infra/main/gitleaks.sh | bash" > .git/hooks/pre-commit
```
Disable gitleaks:
```
git config --global user.gitleaks.enable true
```

Edit git config
```
git config --global -e
```
