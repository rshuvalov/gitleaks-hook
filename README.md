Configure gitleaks pre-commit hook:
```
mv .git/hooks/pre-commit.sample .git/hooks/pre-commit && \
printf "curl https://raw.githubusercontent.com/rshuvalov/gitleaks-hook/main/lib/gl-hook.sh | bash" > .git/hooks/pre-commit
```

Disable gitleaks:
```
git config --global user.gitleaks.enable false
```

Edit git config
```
git config --global -e
```
