import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bussiness/chat_web.bussiness.dart';
import '../../constants/colors/colors.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading = true;
  String response = '''# What is Machine Learning

**Machine learning (ML)** is a subset of artificial intelligence (AI) that enables computers to learn and improve from experience without being explicitly programmed for every task. Rather than following pre-written instructions, machine learning systems automatically identify patterns in data and use these patterns to make predictions or decisions about new, unseen data.[1][2][3]

## Core Definition and Principles

At its essence, machine learning works by training algorithms on large datasets, allowing them to recognize patterns, correlations, and relationships within the data. The fundamental goal is **generalization** - the ability to translate strong performance on training data into useful results in real-world scenarios. This process involves feeding data to machine learning models, which then adjust their internal parameters through mathematical calculations to optimize their behavior according to the patterns they discover.[2][4][1]

The term "machine learning" was first coined by **Arthur Samuel** in 1959, though the mathematical foundations trace back to the 1940s when Walter Pitts and Warren McCulloch developed the first mathematical model of neural networks. Samuel's definition described machine learning as giving "computers the ability to learn without being explicitly programmed".[5]

## Types of Machine Learning

Machine learning approaches are typically categorized into several distinct types, each suited for different kinds of problems and data scenarios:

### Supervised Learning

**Supervised learning** uses labeled datasets where both input data and correct outputs are provided during training. The algorithm learns to map inputs to outputs, enabling it to make predictions on new data. This approach works well for tasks requiring clear predictions or classifications.[6][7][8]

Common supervised learning techniques include:
- **Linear regression** for predicting continuous values
- **Logistic regression** for binary classification tasks
- **Decision trees** for both classification and regression
- **Support Vector Machines (SVM)** for high-dimensional data classification
- **Random forests** for improved accuracy and overfitting control[8]

### Unsupervised Learning

**Unsupervised learning** works with unlabeled data, seeking to discover hidden patterns and structures without predefined correct answers. This approach is particularly useful for exploring large datasets and identifying natural groupings or relationships.[7][6][8]

Key unsupervised learning methods include:
- **Clustering** algorithms like K-means for grouping similar data points
- **Principal Component Analysis (PCA)** for dimensionality reduction
- **Association rules** for finding relationships between variables[8]

### Reinforcement Learning

**Reinforcement learning** involves training algorithms through interaction with an environment, where the system learns optimal actions through trial and error, receiving rewards or penalties for different choices. This approach is commonly used in game-playing AI, robotics, and autonomous systems.[9][6][7]

### Semi-Supervised and Self-Supervised Learning

**Semi-supervised learning** combines elements of both supervised and unsupervised approaches, using a small amount of labeled data alongside larger amounts of unlabeled data. **Self-supervised learning** creates its own supervision signals from the data structure itself, often used in natural language processing and computer vision applications.[7]

## The Machine Learning Workflow

A typical machine learning project follows a systematic workflow comprising several key phases:[10][11]

### Data Collection and Preprocessing

The process begins with **data collection** from various sources, followed by extensive preprocessing to ensure data quality. This phase often consumes the most time in ML projects and includes:[11][10]
- **Data cleaning** to identify and handle errors, outliers, and missing values
- **Data transformation** to convert information into machine-readable formats
- **Feature engineering** to extract meaningful characteristics from raw data[12][11]

### Model Development and Training

The **modeling phase** involves selecting appropriate algorithms based on the problem type and data characteristics. During training, the algorithm learns from the prepared data by adjusting its internal parameters to minimize prediction errors.[10][11]

### Evaluation and Validation

**Model evaluation** assesses performance using validation techniques and metrics appropriate to the problem type. This step ensures the model generalizes well to new, unseen data rather than simply memorizing the training examples.[11][10]

### Deployment and Monitoring

The final phase involves deploying the trained model in production environments and continuously **monitoring its performance** on real-world data. This includes logging predictions and watching for performance degradation that might indicate the need for model retraining.[13][11]

## Real-World Applications

Machine learning has become integral to numerous industries and applications that affect daily life:

### Healthcare and Medical Applications

ML algorithms analyze medical scans, patient data, and genetic information to assist in disease detection, predictive analytics, and drug discovery. These systems often achieve diagnostic accuracy comparable to or exceeding human doctors.[14][15]

### Business and Finance

Financial institutions use machine learning for **fraud detection**, credit risk assessment, and algorithmic trading. Marketing departments leverage ML for customer segmentation, recommendation systems, and optimizing advertising campaigns.[16][15]

### Technology and Communication

''';
  @override
  void initState() {
    super.initState();
    ChatWebService().contentStream.listen((data) {
      if(isLoading){
        response =" ";
      }
      setState(() {
        response += data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'preplexity',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Skeletonizer(
          enabled: isLoading,
          child: Markdown(
            data: response,
            shrinkWrap: true,
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              // Headings
              h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              h2: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white70),
              h3: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white70),

              // Paragraph text
              p: const TextStyle(fontSize: 16, height: 1.5, color: Colors.white70),

              // Links
              a: const TextStyle(
                color: Colors.blueAccent,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),

              // Blockquote style
              blockquote: const TextStyle(fontSize: 16, color: Colors.grey),
              blockquoteDecoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.blueAccent, width: 4)),
                color: AppColors.cardColor.withOpacity(0.5),
              ),

              // Code blocks
              codeblockDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(
                fontSize: 15,
                fontFamily: "monospace",
                color: Colors.greenAccent,
              ),

              // Lists
              listBullet: const TextStyle(color: Colors.blueAccent, fontSize: 18),
            ),
          ),
        )
        ,
      ],
    );
  }
}
