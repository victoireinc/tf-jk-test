resource "google_compute_disk" "testinstance5" {
    name = "testdisk5"
    zone = "europe-west1-b"
    snapshot = "gcs-staging-2-4217178005912824614-1583298001"
    #snapshot = "snapshot-staging2-20200213"
}

resource "google_compute_instance" "testinstance5" {
    name = "test5"
    machine_type = "n1-standard-1"
    zone = "europe-west1-b"
    
    boot_disk {
        source = "testdisk5"
        device_name = "testdisk5-2"        
    }

    # boot_disk {
    #     initialize_params {
    #         image = "yan-one/staging2-img5"
    #     }
    # }

    network_interface {
        network = "default"
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }

    depends_on = [
        google_compute_disk.testinstance5,
    ]

    timeouts {
        create = "2h"
        update = "2h"
        delete = "2h"
        
    }

    #metadata_startup_script = "cd /data/; mkdir testclone; cd testclone; sudo git clone 'https://github.com/orlando-victoire/mftest.git'; cd /data/repo-yanone/; sudo git stash; echo hi > /data/repo-yanone/webroot/pub/media/test20200304.txt;"

    # provisioner "remote-exec" {
    #     inline = [
    #         "touch /data/repo-yanone/webroot/pub/media/test5a.txt",
    #         "touch /data/repo-yanone/test5b.txt"
    #     ]

    #     connection {
    #         type = "ssh"
    #         user = "yossh"
    #         password = "WvG35q2020"
    #         host = ""
    #     }
    # }

    # provisioner "file" {
    #     source = "script5.sh"
    #     destination = "/tmp/script5.sh"
    # }

    # provisioner "remote-exec" {
    #     inline = [
    #         "chmod +x /tmp/script5.sh",
    #         "/tmp/script5.sh"
    #         #"/data/repo-yanone/script5.sh"
    #     ]
    # }

}

