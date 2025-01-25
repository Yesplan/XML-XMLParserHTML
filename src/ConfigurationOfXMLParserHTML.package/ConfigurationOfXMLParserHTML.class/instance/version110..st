versions
version110: spec 
        <version: '1.1.0' imports: #('1.0.0-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'XML-Parser-HTML-Core' with: 'XML-Parser-HTML-Core-monty.18'.
			spec package: 'XML-Parser-HTML-Tests' with: 'XML-Parser-HTML-Tests-monty.7'.
                ].