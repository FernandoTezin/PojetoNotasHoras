final table = '''
CREATE TABLE notas (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  materia VARCHAR(30) NOT NULL,
  nota1 VARCHAR(4) NOT NULL,
  nota2 VARCHAR(4) NOT NULL,
  nota3 VARCHAR(4) NOT NULL)
''';

final insert = '''
INSERT INTO notas (materia, nota1, nota2, nota3)
VALUES ('português','60','87','95')
''';
