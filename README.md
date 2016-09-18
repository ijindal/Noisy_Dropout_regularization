# Noisy_Dropout_regularization
Learning Deep Networks from Noisy Labels with Dropout Regularization

Requirements:

1) Matconvnet library for training deep CNNs https://github.com/vlfeat/matconvnet [Experiments are done on GPUS]

2) Noise selection and noisy data formation file. One can easily generate their own noise dataset by just changing the probability values in the corresponding nosie file. two files both for uniform and non uniform nosie model generation file is given with the names [Uniformnoise.m] and [Randomnoise.m] respectively. Given the input correctly labelled data, using the above mentioned files, incorrect labels can be generated very easily.

3) For the true nosie distribution, which is then used to comapre the proposed results, we have addded another m file named [True_Noise.m]. Output 10x10 matrix for CIFAR-10 from this file can be used as true nosie distribution for furtehr experimentations.

Follow the steps in order.. Before excuting any of the following, make sure that the modified training set is at place in propoer directory.

Implementation steps:

A) For Base model: Use exapmpels\cnn_cifar.m for training CNN on CIFAR-10 dataset. no need to add any linear noisy layer.

B) For true noise model Use the base model architecture as it is and add an extra linear layer at the output of softmax layer. This layer parameters kept fixed for all the experiments for true noise model.

C) For Linear+Softmax layer add an another softmax layer at the end of linear layer and before the loss layer.

D) Proposed approach Now, use the architecture form (C) and introduce a dropout layer after linear layer and before softmax layer with fixed parameters 0.1.

For all the models:

At test time, just use the parameters for the base model and take the softmax at last.

In case of MNIST dataset on CNN follow the same proceduee as stated above. And for Deep neural network use the given file dnnmnistinit.m and place it into exapmple\mnist folder and perform same set of experiments as for the previous case.
