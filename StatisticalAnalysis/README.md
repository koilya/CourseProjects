# S1 Coursework
In this project, we aims to make a comparison between the statistical power of a multi-dimensional maximum likelihood fit and a weighted fit exploiting sWeights.

# Environment requirements
To ensure that the notebook runs as expected on your device, please, ensure that you have all necessary packages installed in your working environment, using:
```bash
pip install -r requirements.txt
```

## AI tools usage
ChatGPT was only used supportively, namely for:
- Debugging the dblquad integration 
- Hiding warnings for notebook cleanliness, using filterwarnings
- To define truncated exponential cdf using stats.truncexpon.cdf
- Using "except Exception as e" with try.