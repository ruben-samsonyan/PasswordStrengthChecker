Pod::Spec.new do |s|
  name    = "RUBSPasswordStrength"
  url     = "https://github.com/screeninteraction/#{name}"
  git_url = "#{url}.git"
  version      = "1.0.0"
  source_files = "#{name}/**/*.{h,m}"

  s.name         = name
  s.version      = version
  s.summary      = "Check Password Strength thanks to ruben-samsonyan"
  s.description  = <<-DESC
                *  Very simple interface to check password strength. 
                *  Fork from https://github.com/ruben-samsonyan to add nicer public interface
                *  Podified

                   DESC
  s.homepage     = url
  s.license      = 'MIT'
  s.author       = {  "Seivan Heidari" => "seivan.heidari@icloud.com",
                      "Ruben Samsonyan" => "seivan.heidari@me.com"
                    }
  
  s.source       = { :git => git_url, :tag => version }
  

  s.platform  = :ios, "6.0"

  s.source_files = source_files
  s.requires_arc = true
end
