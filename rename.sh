# 旧名と新名を引数から取得
oldname=$1
newname=$2

# ファイル名・フォルダ名の変更
mv ./api/src/$oldname ./api/src/$newname
mv $oldname.code-workspace $newname.code-workspace

# pyproject.toml内の名前を変更
sed -i "" "s/$oldname/$newname/g" api/pyproject.toml
sed -i "" "s/$oldname/$newname/g" api/Dockerfile
sed -i "" "s/$oldname/$newname/g" api/src/$newname/services/opensearch.py
sed -i "" "s/$oldname/$newname/g" api/tests/test_sample.py
sed -i "" "s/$oldname/$newname/g" README.md
sed -i "" "s/$oldname/$newname/g" docker-compose.yml
