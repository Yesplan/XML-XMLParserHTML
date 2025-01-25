versions
version118: spec 
        <version: '1.1.8' imports: #('1.1.4-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'XML-Parser-HTML-Core' with: 'XML-Parser-HTML-Core-monty.26'.
			spec package: 'XML-Parser-HTML-Tests' with: 'XML-Parser-HTML-Tests-monty.13'.
                ].