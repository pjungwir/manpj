source ~/sqllib/db2profile
db2start
db2
create database paul  (first time only)
connect to paul


Eh, that above method has weird dependencies that Ubuntu refuses to install (see https://www.kbce.com/kb/installing-db2-on-ubuntu/). So let's try Docker (https://hub.docker.com/r/ibmcom/db2):

docker pull ibmcom/db2
mkdir -p ~/local/db2/data
docker run -tid --name mydb2 --privileged=true -p 50000:50000 -e LICENSE=accept -e DB2INST1_PASSWORD=foobar -e DBNAME=testdb -v ~/local/db2/data ibmcom/db2
# wait a couple minutes, watching
docker logs -f mydb2
# Wait for "Setup has completed", then:
docker exec -ti mydb2 bash -c "su - db2inst1" # blech, doesn't work, seems like the binary name is working.
# This is okay though:
docker exec -ti mydb2 bash
# then inside the container:
source /database/config/db2inst1/sqllib/db2profile
db2
connect to testdb # no semicolon!

