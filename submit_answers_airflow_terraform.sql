-- AFC Redgrave · Airflow + Terraform lab · write your answers in YOUR Snowflake account
-- Réponses préparées : Q4 doit être confirmée par le plan réel de T3 avant soumission.
-- You can run this file again: it replaces your previous answers for this lab.

USE ROLE SYSADMIN;
USE WAREHOUSE REDGRAVE_WH;
CREATE SCHEMA IF NOT EXISTS REDGRAVE.LAB;
CREATE TABLE IF NOT EXISTS REDGRAVE.LAB.ANSWERS (
    lab VARCHAR, question VARCHAR, answer VARCHAR, submitted_at TIMESTAMP_TZ);

DELETE FROM REDGRAVE.LAB.ANSWERS WHERE lab = 'RED-401';

INSERT INTO REDGRAVE.LAB.ANSWERS VALUES
('RED-401', 'NAME', $$Matis Douay$$, CURRENT_TIMESTAMP()),
('RED-401', 'Q1', $$La première tentative a déjà inséré et validé la ligne avant le crash simulé. La nouvelle tentative réexécute INSERT pour le même jour et ajoute une ligne supplémentaire.$$, CURRENT_TIMESTAMP()),
('RED-401', 'Q2', $$MERGE utilise sales_date pour mettre à jour une ligne existante ou insérer un jour absent : réexécuter la publication ne crée donc pas de nouvelle ligne pour ce jour, à condition que les données initiales ne contiennent pas déjà de doublons.$$, CURRENT_TIMESTAMP()),
('RED-401', 'Q3', $$Le 4 août 2026 : le run du 5 août à 06:00, heure de Londres, publie le jour précédent, terminé. La date est calculée à partir du run avec macros.ds_add(ds, -1), ce qui permet aussi le backfill.$$, CURRENT_TIMESTAMP()),
('RED-401', 'Q4', $$À vérifier pendant T3 : après le passage manuel du warehouse BI à SMALL, le plan doit proposer warehouse_size = SMALL -> XSMALL, soit 0 ajout, 1 modification et 0 destruction, car le code déclare XSMALL.$$, CURRENT_TIMESTAMP()),
('RED-401', 'Q5', $$Un state distant permet à tous les membres et à la CI de partager le même état des ressources ; le verrou empêche des écritures concurrentes qui pourraient rendre cet état incohérent.$$, CURRENT_TIMESTAMP()),
('RED-401', 'REPO_URL', $$https://github.com/matisdy/redgrave-platform$$, CURRENT_TIMESTAMP());

SELECT question, answer FROM REDGRAVE.LAB.ANSWERS WHERE lab = 'RED-401' ORDER BY question;
