import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Changable variabels
nbins = 8
filename = "lorenz_traj.csv"

x_values = []
y_values = []


# Read CSV (Column names and order: t,x,y,z)
df = pd.read_csv(filename, comment="#", skipinitialspace=True)  # Imporitng CSV data as a dataframe

t = df["t"].to_numpy()      # Converts t column to numpy array
x = df["x"].to_numpy()      # Converts x column to numpy array

sign_x = np.sign(x)     # Gets the sign of x for time changes
dwelltime = []      # Declare an empty array for dwell times
starttime = t[0]    # Set start time 

for i in range(1, len(sign_x)):     # Handles any 0 values for t
    if sign_x[i] == 0:
        sign_x[i] = sign_x[i-1]     # If the t is zero, set it's sign to the previous time's sign

for i in range(1, len(sign_x)):
    if (sign_x[i] != sign_x[i-1]):      # Sign change has occured
        dwelltime.append(t[i] - starttime)      # Calculate dwell time
        starttime = t[i]        # Set new start time 

dwelltime = np.array(dwelltime)     # Converts the dwelltime array to a numpy array
current = dwelltime[:-1]
next_ = dwelltime[1:]

edges = np.quantile(current, np.linspace(0,1,nbins+1))      # Creates bins for data based on percentiles
bin_id = np.digitize(current, edges[1:-1])      # Creates an array with the bin number indices    

for i in range(nbins):
    m = (bin_id == i)
    if m.sum == 0 :
        continue
    x_values.append(np.median(current[m]))
    y_values.append(np.mean(next_[m]))

y_error_values = []
for i in range(nbins):
    m = (bin_id == i)
    if m.sum() < 2:
        y_error_values.append(np.nan)
        continue
    y_error_values.append(np.std(next_[m], ddof=1)/np.sqrt(m.sum()))

    
plt.errorbar(x_values,y_values, yerr=y_error_values, fmt='o', capsize=3)
plt.axhline(np.mean(next_), linestyle = "--")
plt.show()