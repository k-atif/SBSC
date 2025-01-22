# SBSC
This repository provides the implementation of our clustering algorithm, named SBSC. 

A python notebook file is provided along with neccessary files, such as five synthetic datasets to test the algorithm and "k_mst2.pyx" file to perform 2-rounds of MST faster. Two synthetic datasets are large sized, so the codes ("gen_2d_data.ipynb") to generate them is added to the repository.

The code needs following additional libraries/tools to be executed:

(1) NumPy, (2) SciPy, (3) Pandas, (4) Matplotlib, (5) scikit-learn, and (6) Cython to compile "k_mst2.pyx" file.

Link for real-datassets: http://archive.ics.uci.edu/ml

We have also added the visual results of SBSC and and other baseline methods for synthetic datasets.
