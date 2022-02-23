# Computing D-Stationary Points of rho-Margin Loss SVM

This paper is concerned with the algorithmic aspects of sharper stationarity of a nonconvex, nonsmooth, Clarke irregular machine learning model. We study the SVM problem with a $\rho$-margin loss function, which is the margin theory generalization bound of SVM introduced in the learning theory textbook by Mohri et al. [26], and has been extensively studied in operations research, statistics, and machine learning communities. However, due to its nonconvex, nonsmooth, and irregular nature, none of the existing optimization methods can efficiently compute a d(irectional)-stationary point, which turns out to be also a local minimum, for the $\rho$-margin loss SVM problem. After a detailed discussion of various nonsmooth stationarity notions, we propose a highly efficient nonconvex semi-proximal ADMM-based scheme that provably computes d-stationary points and enjoys a local linear convergence rate. We report concrete examples to demonstrate the necessity of our assumptions. Numerical results verify the effectiveness of the new algorithm and complement our theoretical results.


# Citation
If you find our paper or this project helps your research, please kindly consider citing our paper in your publications.
```bash
@article{tian2022computing,
  title={Computing D-Stationary Points of $\rho$-Margin Loss SVM},
  author={Tian, Lai and So, Anthony Man-Cho},
  journal={Artificial Intelligence and Statistics},
  year={2022},
  rganization={PMLR}
}
```