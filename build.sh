ls
if [ -d hello-world-war ]
then
rm -rf *
fi
git clone https://github.com/SanjanaKrishna/hello-world-war.git
cd hello-world-war
mvn clean package
ls
echo "$1 $2"
