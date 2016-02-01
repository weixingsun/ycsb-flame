function scp_justhost()
{
  echo "scp $1 nzmesse1@nzmessengers.co.nz:/home2/nzmesse1/www/"
  scp $1 nzmesse1@nzmessengers.co.nz:/home2/nzmesse1/www/
}
scp_justhost flame.mysql.svg
