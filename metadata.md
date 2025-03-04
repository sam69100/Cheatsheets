# Cheat Sheet - Outils Linux pour Extraire des Données

## Images
- Extraire métadonnées (EXIF) : `exiftool image.jpg`
- OCR pour extraire texte : `tesseract image.png output -l fra` (fra = français)
- Convertir PDF en images : `pdftoppm -png file.pdf output`

## Fichiers ZIP
- Extraire contenu sans décompresser : `unzip -p archive.zip file.txt`
- Lister contenu avec détails : `zipinfo -l archive.zip`
- Voir contenu interactivement : `less archive.zip`

## Fichiers PDF
- Extraire images en JPG : `pdfimages -j file.pdf output`
- Extraire texte : `pdftotext file.pdf output.txt`
- Convertir en HTML avec images : `pdftohtml -c file.pdf output.html`
- Paquet requis : `poppler-utils`

## Autres Formats
- Extraire contenu (7z, rar, etc.) : `7z x archive.7z`
- Extraction intelligente (tar, zip, etc.) : `dtrx archive.tar.gz`
- Identifier type de fichier : `file file.unknown`
- Extraire chaînes lisibles : `strings binaryfile`

## Métadonnées Génériques
- Extraire métadonnées : `exiftool file.any`
- Supprimer métadonnées (pré-extraction) : `mat2 file.any`
