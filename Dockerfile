# Use the official Anaconda image as a base
FROM continuumio/anaconda3

# Copy the environment.yml file into the container
COPY environment.yml /tmp/environment.yml

# Create the Conda environment using the environment.yml file
RUN conda env create -f /tmp/environment.yml && conda clean -a -y

# Set the environment variable to use the newly created Conda environment
ENV PATH /opt/conda/envs/ai-ml-llm-env/bin:$PATH

# Expose the port for Jupyter Notebook
EXPOSE 8888

# Set the working directory
WORKDIR /home/jovyan

# Install Jupyter if it wasn't in the environment.yml (optional)
RUN conda install -n ai-ml-llm-env jupyter

# Start Jupyter Notebook when the container runs
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]