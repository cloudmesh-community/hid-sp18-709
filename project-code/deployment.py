from abc import ABC, abstractmethod
 
class AbstractDeplyment(ABC):
 
     def __init__(self):
         super().__init__()
    
     @abstractmethod
     def prepare(self):
	 """prepares installation including downloads and other installs needed"""
	 pass

    @abstractmethod
    def deploy(self):
         """deployes the package or software"""
	pass

    @abstractmethod	
    def configure(self):
        """does som configurations"""
	pass

    @abstractmethod	
    def test(test):		
         """does a test wheer a name is passed of a test (you could have multiple)
         the name all woudl be running all tests"""
	pass
