#!/bin/bash

# Назва проекту
name=$1

# Версія проекту
version=$2

# Отримуємо повідомлення останнього коміту. 
commit_message=$(git log -1 --pretty=format:%s)

# Перевіряємо, чи повідомлення не починається зі слова 'Release'.
if [[ "$commit_message" != "Release"* ]]; then
  # Якщо останній коміт не релізний - виводимо помилку
  echo "Error: The last commit must be a release commit" >&2
  # Завершуємо скрипт із кодом помилки
  exit 1
fi

# Отримуємо останні дані з віддаленого репозиторію без об'єднання
# '>/dev/null 2>&1' перенаправляє вивід та помилки в нікуди.
git fetch >/dev/null 2>&1

# Отримуємо SHA-ідентифікатор локального коміту (HEAD)
local_sha=$(git rev-parse HEAD)

# Отримуємо SHA-ідентифікатор останнього коміту із віддаленої гілки
remote_sha=$(git rev-parse @{u})

# Перевіряємо, чи останній коміт знаходиться у віддаленому репозиторії
if [[ "$local_sha" != "$remote_sha" ]]; then
  echo "Error: The last commit has not been pushed to the remote repository" >&2
  exit 1
fi

# Виводимо інформаційне повідомлення
echo Creating GitHub release v$version for \"$name\" project

# Заголовок релізу
titleMessage="${name//_/ } v$version"

# Опис релізу
notesMessage="Version $version"

# Помилок немає - створюємо GitHub-реліз
gh release create v$version --title "$titleMessage" --notes "$notesMessage"

