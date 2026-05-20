# A2 Coursework
In this project, we explore different techniques across three areas of medical imaging: PET-CT image reconstruction, MRI image denoising, and CT image segmentation and classification.

# Environment requirements
To ensure that the notebook runs as expected on your device, please, ensure that you have all necessary packages installed in your working environment, using:
```bash
pip install -r requirements.txt
```

# Repository files/folders description
- A2Module1.ipynb: a Jupyter notebook with solution to Part1 of the coursework assignment.
- A2Module2.ipynb: a Jupyter notebook with solution to Part2 of the coursework assignment.
- A2Module3.ipynb: a Jupyter notebook with solution to Part3 of the coursework assignment.
- module1/: a repository containing data files necessary for A2Module1.ipynb to function.
- module2/: a repository containing data files necessary for A2Module2.ipynb to function. 
- module3/: a repository containing data files necessary for A2Module3.ipynb to function and a LICENSE.txt file that lists the requirements of using the data in this folder. This folder wasn't loaded as expected due to large data file sizes...
- requirements.txt: a text file containing information about all necessary packages to tun all notebooks.
- report/: a repository containing the report in PDF format.
- A2_Coursework.pdf: the file with task.
- README.md: this file with instructions and overview.
- .gitignore: a hidden file that prevents unnecessary files from uploading to gitlab.

# To run this project
Please, download the entire project repository (as it contains necessary data in respective module folders for each module notebook to run as expected). Each notebook can then be run after installing all the required packages as described above.
Also, module3 repository needs to contain data files which couldn't be uploaded due to sizing issues. It should have 2 repositories within it, one named masks with all the mask files inside, and one named scans with all the scans inside.

## AI tools usage
ChatGPT was only used supportively, namely for:
- Suggested use of scipy.ndimage for image resizing
- Avoiding zero division in OSEM
- Suggesting using uniform_filter from scipy.ndimage (consulted since couldn't find a mean_filter function myself)
- Providing the backbone for some doctrings which I then refined and corrected
- Suggested use of .copy() for storing the read-in data using SimpleITK as I was getting corrupted data and unexpected behavior, but couldn't identify any bugs in the code 
- Suggested .astype(np.uint8) for memory usage efficiency (vs .astype(np.uint8))
- Merging multiple dataframes into 1, and converting dictionaries to dataframes correctly.
- Understanding how to extract 'feature importance' from Random Forest CLassifier model.
