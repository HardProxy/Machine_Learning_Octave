% Jason Joseph Rebello
% Carnegie Mellon University (Jan 2012 - May 2013) 
% Masters in Electrical & Computer Engineering
% Logistic Regression with Regularization

% Run LogisitcRegression.m
% This program uses Logistic regression to classify handwritten digits. The
% data is comprised of a part of the MNIST dataset. 5000 examples are used.

clear all;
clc;
close all;

%% Load Training Data
t = cputime;
fprintf('Loading and Visualizing Data')

load('data.mat');

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

#displayData(X(sel, :)); % function taken from Andrew Ng machine learning course
fprintf('...done\n');

%% Split data into training and testing
fprintf('Splitting Data into training and testing sets');
[XTrain XTest yTrain yTest] = splitData(X, y);
fprintf('...done\n\n');

%% Initialize parameters
fprintf('Initializing parameters');
m = size(X, 1); % number of examples
lambda = 0.1; % regularization parameter
numLabels = size(unique(y),1); % number of labels
fprintf('...done\n');

%% Training Logistic Regression classifier
fprintf('Training One-vs-All Logistic Regression');

theta = LRClassifier(XTrain, yTrain, numLabels, lambda);
fprintf('...done\n');

%% Predict numbers 
prediction = predict(theta, XTest);

%% Calculate Accuracy over the training data
fprintf('\nTest Set Accuracy: %f\n', mean(double(prediction == yTest)) * 100);

fprintf('Program executed in %f seconds or %f minutes\n', cputime-t, (cputime-t)/60);

  pred_errors = prediction != yTest;
  num_test_observations = size(XTest, 1);
  num_test_errors = sum(pred_errors);
  num_test_hits = num_test_observations - num_test_errors;
  
  % Procurando todos os erros e mostrando na Tela 

  error_rows = find(pred_errors);
  X_errors = XTest(error_rows, :);
  y_errors = prediction(error_rows, :);
  y_actual = yTest(error_rows);


  % Calculando a frequência de erros para cada classificação
  freq = zeros(10);
  num_erros = size(X_errors,1);
  
  fprintf("Frequência de Erros para cada classificação : \n");
  for i = 1:10,
    freq(i) = sum(y_errors == i)/num_erros;
    fprintf("Classificação %d = %f\n",i,freq(i));
  endfor;  
