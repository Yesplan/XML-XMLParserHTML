versions
version122: spec 
        <version: '1.2.2' imports: #('1.2.2-baseline')>

        spec for: #common do: [
                spec blessing: #release.
			spec package: 'XML-Parser-HTML-Core' with: 'XML-Parser-HTML-Core-monty.32'.
			spec package: 'XML-Parser-HTML-Tests' with: 'XML-Parser-HTML-Tests-monty.17'.
                ].