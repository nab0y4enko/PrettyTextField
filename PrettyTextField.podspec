Pod::Spec.new do |s|
    s.name         = "PrettyTextField"
    s.version      = "0.0.2"
    s.summary      = "A custom TextField with a changable padding for the text."

    s.description = <<-DESC
                    PrettyTextField - a pretty text field with a changable padding for the text.
                    PrettyPasswordTextField - a pretty text with a switchable icon which shows or hides the password.
                    DESC

    s.homepage     = "https://github.com/nab0y4enko/PrettyTextField"
    s.license      = "MIT"

    s.author              = { "Oleksii Naboichenko" => "nab0y4enko@gmail.com" }
    s.social_media_url    = "https://twitter.com/nab0y4enko"

    s.platform        = :ios, "8.0"

    s.source          = { :git => "https://github.com/nab0y4enko/PrettyTextField.git", :tag => "#{s.version}" }

    s.source_files    = "Sources/**/*.swift"
    s.resources       = "Sources/**/*.xcassets"
    s.frameworks      = "UIKit"

    s.requires_arc    = true
end
