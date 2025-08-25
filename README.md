# **Implementation guide of the work \- “SBSC: Self-tuned Bipartite Proximity Graph-based Spectral Clustering”**

This repository provides a Jupyter Notebook implementation of our work “SBSC: A fast Self-tuned Bipartite Proximity Graph-based Spectral Clustering”, available at [https://doi.org/10.1145/3725418](https://doi.org/10.1145/3725418). It is a fast clustering algorithm that is designed to efficiently construct a sparse bipartite proximity graph while preserving clustering quality, enabling spectral clustering on large datasets.

## **Datasets**

There are a total of five synthetic and thirteen real datasets in the experiment. We generate synthetic datasets ourselves, and the real datasets are taken from the UCI machine learning repository ([https://archive.ics.uci.edu/](https://archive.ics.uci.edu/)), the OpenML library ([https://www.openml.org/](https://www.openml.org/)), and ([https://www.nist.gov/itl/products-and-services/emnist-dataset](https://www.nist.gov/itl/products-and-services/emnist-dataset)). 

We have maintained a directory that contains all these datasets over a public drive with the following link:

[https://drive.google.com/drive/folders/1ghw\_23DKX953DXk2v66QU\_7DLhU0RTEH?usp=sharing](https://drive.google.com/drive/folders/1ghw_23DKX953DXk2v66QU_7DLhU0RTEH?usp=sharing) 

The datasets are provided for the purpose of only testing and running our algorithm (SBSC). In case anyone wants to use these **synthetic datasets** in their work, please cite our paper. If anyone is using or referencing the **real datasets** that are included in our experiment, then please cite the papers and works of the original authors/contributors, whose required details are available at:

1. [https://archive.ics.uci.edu/](https://archive.ics.uci.edu/)   
2. [https://www.openml.org/](https://www.openml.org/)  
3. [https://www.nist.gov/itl/products-and-services/emnist-dataset](https://www.nist.gov/itl/products-and-services/emnist-dataset) .

## 

## **System Requirements**

The following system requirements are recommended:

* Platform: Windows, Linux, or macOS with Python 3.8 (or later) and  Jupyter Notebook installed. Minimum RAM requirement: 12 GB  
* Required Python libraries:  
  * Numpy  
  * Pandas  
  * Matplotlib  
  * Scikit-learn  
  * Scipy  
  * Seaborn  
  * Cython  
    

## **Installation**

Install the required Python libraries:

**pip install numpy pandas matplotlib scikit-learn scipy seaborn cython**

## **OR**

You can use online platforms like Google Colab and Kaggle to run the given notebook file straightforwardly. However, it is required to upload the datasets to those platforms.

## **Usage**

1. Clone the repository and open the Jupyter Notebook from the command prompt as: *jupyter notebook SBSC.ipynb*  
2. From the given notebook, first Cythonize the “kmst\_2.pyx” file by running the first cell. We can also perform this from the terminal using the command:   
             python setup.py build\_ext \--inplace

3. Run all the cells to apply SBSC for the given datasets.   
4. To run SBSC for a dataset, we have to call the following function:   
   sbsc(X, K, k\_dash\=10, noise\=1e-10, num\_iter\=10, num\_rounds\=2, max\_iter\=300, is\_plot\=False, verbose\=0, ds\_name\='undefined', target\_path\='/')

5. To run for a single dataset, we can simply call:   
    		sbsc(X, K, num\_iter=10, verbose=1) 

   Here, *X* is the dataset having features as columns, *K* is the number of clusters, *num\_iter* is the number of times to execute the algorithm, and *verbose* is for displaying and storing results. To display results of each run, set *verbose=1,* and for storing the predicted clustering labels, pass *verbose=2*.

6. The code also provides the visualization of produced clusters for the synthetic datasets in the **“Run for a single dataset”** section. The same section also provides the visualization of each step of SBSC for a synthetic dataset, as plotted in the paper. For it, we have to pass: *is\_plot=True*  
7. To run SBSC for multiple datasets, execute the cells of the **“Run multiple datasets”** section. The following variables are required to set.  
   1. *base\_path:* The path of the datasets’ directory.  
   2. *datasets* and *seps:* The list of file names of datasets and their separators.  
   3. *target\_path:* The path of the directory to store the predicted labels.  
   4. *target\_path\_2:* The path of the directory to save the results.  
   5. *verbose:* Set *verbose=2* to store the results.  
   6. *num\_iter:* Number of times to execute SBSC for each dataset.  
   7. *noise:* It's an additional parameter with a default value of *1e-10* to avoid convergence and divide-by-zero warnings.  
   8. *df\_CAs* and *df\_RIs* will store the clustering accuracy and rand index, respectively, which are produced by SBSC in each iteration for the given datasets. Its last two columns contain the average and standard deviation of results produced in each run. In the paper, the entries of the last two columns of *df\_CAs* and *df\_RIs* are noted in Table 3\.  
   9. *df\_RT* stores the execution time taken by SBSC for every dataset.  
8. The last cell is for analyzing the stored labels.  
9. For the ablation study, it is required to run the algorithm by varying the *k\_dash*  parameter from *4 to 15* and *num\_rounds* from *2 to 5*.