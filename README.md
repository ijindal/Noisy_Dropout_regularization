# Noisy_Dropout_regularization

Learning Deep Networks from Noisy Labels with Dropout Regularization

**Requirements:**

- Matconvnet library for training deep CNNs https://github.com/vlfeat/matconvnet [Experiments are done on GPUS]

- Noise selection and noisy data formation file. One can easily generate their own noise dataset by just changing the probability values in the corresponding nosie file. two files both for uniform and non uniform nosie model generation file is given with the names `Uniformnoise.m` and `Randomnoise.m` respectively. Given the input correctly labelled data, using the above mentioned files, incorrect labels can be generated very easily.

- For the true nosie distribution, which is then used to comapre the proposed results, we have addded another m file named `True_Noise.m`. Output 10x10 matrix for CIFAR-10 from this file can be used as true nosie distribution for furtehr experimentations.

Follow the steps in this order.. Before excuting any of the following, make sure that the modified training set is at place in propoer directory.

Implementation steps:

- For Base model: Use exapmpels\cnn_cifar.m for training CNN on CIFAR-10 dataset. no need to add any linear noisy layer.

- For true noise model Use the base model architecture as it is and add an extra linear layer at the output of softmax layer. This layer parameters kept fixed for all the experiments for true noise model.

- For Linear+Softmax layer add an another softmax layer at the end of linear layer and before the loss layer.

- Proposed approach Now, use the architecture form (C) and introduce a dropout layer after linear layer and before softmax layer with fixed parameters 0.1.

For all the models:

At test time, remove the noise model and use base model prediction as final prediction.

In case of MNIST dataset on CNN follow the same proceduee as stated above. And for Deep neural network use the given file dnnmnistinit.m and place it into exapmple\mnist folder and perform same set of experiments as for the previous case.


One can find the implementation of `randfixedsum.m` at this [link](https://www.mathworks.com/matlabcentral/fileexchange/9700-random-vectors-with-fixed-sum?focused=5064802&tab=function)



**Citing:**

If you use this work in your research, please cite the following paper:

```

@inproceedings{jindal2016learning,
  title={Learning deep networks from noisy labels with dropout regularization},
  author={Jindal, Ishan and Nokleby, Matthew and Chen, Xuewen},
  booktitle={Data Mining (ICDM), 2016 IEEE 16th International Conference on},
  pages={967--972},
  year={2016},
  organization={IEEE}
}

```
