
import UIKit

class StudentCell: UITableViewCell {
    
    // Outlets for UI elements in the cell
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var programLabel: UILabel!
    @IBOutlet weak var parentPhoneLabel: UILabel!
    @IBOutlet weak var parentEmailLabel: UILabel!
    
    // Optional: Add any additional properties or methods for customizing the cell
    
    // You may want to override awakeFromNib() to perform any additional setup after loading the cell from the storyboard
    override func awakeFromNib() {
        super.awakeFromNib()
        // Additional setup code
    }
    
    // Optional: Override setSelected(_:animated:) if you need custom behavior when the cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
