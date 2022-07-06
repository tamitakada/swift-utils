import UIKit


/*
 
    This table contains a heading label which will be displayed above how ever many columns you want.
    
    IMPORTANT: You need to have the extensions file downloaded as well for this to work.
 
    If you're having trouble getting the table/columns to be displayed, make sure that you set a height for each column and/or the table.
 
*/

class VerticalTable: UIView {
    
    let titleLabel = UILabel()
    
    init(columns: [UIView]) {
        super.init(frame: .zero)
        setUp(columns: columns)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp(columns: [UIView]) {
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(titleLabel)
        titleLabel.centerView(x: true, y: false)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        let rowStack = UIStackView()
        rowStack.axis = .horizontal
        rowStack.spacing = 10
        rowStack.distribution = .fillEqually
        rowStack.alignment = .fill
        
        addSubview(rowStack)
        rowStack.constrain(
            top: titleLabel.bottomAnchor, constantTop: 10,
            bottom: self.bottomAnchor, constantBottom: 0,
            trailing: self.trailingAnchor, constantTrailing: -10,
            leading: self.leadingAnchor, constantLeading: 10
        )
        
        for c in columns {
            let container = UIView()
            container.addSubview(c)
            c.constrain(
                top: container.topAnchor, constantTop: 0,
                bottom: container.bottomAnchor, constantBottom: -10,
                trailing: container.trailingAnchor, constantTrailing: 0,
                leading: container.leadingAnchor, constantLeading: 0
            )
            rowStack.addArrangedSubview(container)
        }
    }
    
}
