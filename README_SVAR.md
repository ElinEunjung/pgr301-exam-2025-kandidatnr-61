# Oppgave 1
I oppgave 1 har jeg satt opp en S3-bucket kandidat-61-data i region eu-west-1 ved hjelp av Terraform. Bucketen har en egen lifecycle-policy for prefix midlertidig/, der objekter flyttes til GLACIER etter 30 dager og slettes etter 60 dager. Øvrige objekter i bucketen blir liggende permanent. I tillegg er public access blokkert, og versjonering er aktivert. Terraform state lagres i S3-backend pgr301-terraform-state, slik at infrastrukturen kan kjøres repeterbart via Terraform og GitHub Actions.

# Oppgave 2
# Oppgave 3
# Oppgave 4
# Oppgave 5
