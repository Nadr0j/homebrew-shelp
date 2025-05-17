class Shelp < Formula
    include Language::Python::Virtualenv
  
    desc     "AI-powered shell-command helper"
    homepage "https://github.com/Nadr0j/shelp"
    url      "https://github.com/Nadr0j/shelp/releases/download/v0.1.0/shelp-0.1.0.tar.gz"
    sha256   "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
    license  "MIT"
  
    depends_on "python@3.12"                 
  
    # ───── Python dependencies ──────────────────────────────────────────────────
    resource "colorama" do
      url    "https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4/colorama-0.4.6.tar.gz"
      sha256 "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
    end
  
    resource "httpx" do
      url    "https://files.pythonhosted.org/packages/bd/26/2dc654950920f499bd062a211071925533f821ccdca04fa0c2fd914d5d06/httpx-0.26.0.tar.gz"
      sha256 "451b55c30d5185ea6b23c2c793abf9bb237d2a7dfb901ced6ff69ad37ec1dfaf"
    end
  
    resource "openai" do
      url    "https://files.pythonhosted.org/packages/64/69/7babc224019e4cfc0b6151f8170cf51ead088ba2c3b4f65dd731a794aa16/openai-1.25.0.tar.gz"
      sha256 "22c35b26b8281cd2759b1a4c05ac99e2f2b26a9df71f90a0b4ddb75aa27adc81"
    end
  
    # ───── build / install ──────────────────────────────────────────────────────
    def install
      virtualenv_install_with_resources      # 1-line helper: creates venv, pip-installs everything,
    end                                       # and symlinks the CLI stub into `bin/`.
  
    # ───── post-install test ───────────────────────────────────────────────────
    test do
      assert_match "Usage", shell_output("#{bin}/shelp 2>&1", 1)
    end
  end
  