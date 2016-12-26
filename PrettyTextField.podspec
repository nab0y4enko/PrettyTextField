Pod::Spec.new do |s|
    s.name         = "PrettyTextField"
    s.version      = "0.0.1"
    s.summary      = "A pretty heir of UITextField."

    s.description = <<-DESC
                    A pretty text field with the ability to change a padding for the text.
                    DESC

    s.homepage     = "https://github.com/nab0y4enko/PrettyTextField"
    s.license      = "MIT"

    s.author              = { "Oleksii Naboichenko" => "nab0y4enko@gmail.com" }
    s.social_media_url    = "https://twitter.com/nab0y4enko"

    s.platform        = :ios, "8.0"

    s.source          = { :git => "https://github.com/nab0y4enko/PrettyTextField.git", :tag => "#{s.version}" }

    s.source_files    = "Sources/**/*.swift"

    s.frameworks      = "UIKit"

    s.requires_arc    = true
end
