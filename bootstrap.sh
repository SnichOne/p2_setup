# upgrade packages
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
sudo apt-get update
sudo apt-get -y upgrade


# install general libraries
sudo apt-get install -y build-essential git python-pip libfreetype6-dev libxft-dev libncurses-dev libopenblas-dev gfortran libblas-dev liblapack-dev libatlas-base-dev python-dev linux-headers-generic linux-image-extra-virtual unzip swig unzip wget pkg-config zip g++ zlib1g-dev libcurl3-dev
pip install -U pip


# install neovim
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim


# install CUDA 8 from deb (network)
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
rm cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo apt-get update
sudo apt-get install -y cuda


# install cudnn
wget https://www.dropbox.com/s/pw1vop0nv5i9wlw/libcudnn5_5.1.10-1%2Bcuda8.0_amd64.deb
wget https://www.dropbox.com/s/v6w14qzk5ltgjq0/libcudnn5-dev_5.1.10-1%2Bcuda8.0_amd64.deb
sudo dpkg -i libcudnn5_5.1.10-1+cuda8.0_amd64.deb
sudo dpkg -i libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb
rm libcudnn5_5.1.10-1+cuda8.0_amd64.deb
rm libcudnn5-dev_5.1.10-1+cuda8.0_amd64.deb


# install zsh
sudo apt-get install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
sudo chsh ubuntu -s /bin/zsh

# dotfiles
cp .zshrc ~/
cp .zshenv ~/
cp .tmux.conf ~/
mkdir -p ~/.config/nvim/
cp init.vim ~/.config/nvim/

source ~/.zshenv


# install python libraries
pip install --user cython pandas sklearn bs4 tqdm jupyter pylint pep8 neovim requests

# install neovim plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# install deep learning frameworks
pip install --upgrade --user tensorflow-gpu
pip install --user keras
