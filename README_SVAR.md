# Oppgave 1
I oppgave 1 har jeg satt opp en S3-bucket kandidat-61-data i region eu-west-1 ved hjelp av Terraform. Bucketen har en egen lifecycle-policy for prefix midlertidig/, der objekter flyttes til GLACIER etter 30 dager og slettes etter 60 dager. Øvrige objekter i bucketen blir liggende permanent. I tillegg er public access blokkert, og versjonering er aktivert. Terraform state lagres i S3-backend pgr301-terraform-state, slik at infrastrukturen kan kjøres repeterbart via Terraform og GitHub Actions.

# Oppgave 2
## Del A
- API Gateway URL: https://zy054y3jhj.execute-api.eu-west-1.amazonaws.com/Prod/analyze/
- S3 objekt: s3://kandidat-61-data/midlertidig/comprehend-20251113-213527-2718ec4f.json

## Del B
- Workflow-fil: https://github.com/ElinEunjung/pgr301-exam-2025-kandidatnr-61/blob/main/.github/workflows/sam-deploy.yml
- Successful deploy: https://github.com/ElinEunjung/pgr301-exam-2025-kandidatnr-61/actions/runs/19347765030/job/55352357953
- PR validation: 
- Instrukskjoner til sensor:



# Oppgave 3
# Oppgave 4
# Oppgave 5
