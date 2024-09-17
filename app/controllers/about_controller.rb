# This inherits all the functionality from rails
class AboutController < ApplicationController
  # Didn't specify any rendering so will use the rails default render
  # Will look for the index.html file in the about folder in views
  def index
  end
end