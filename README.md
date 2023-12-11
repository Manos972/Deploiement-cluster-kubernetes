## Le fichier YAML est un playbook Ansible qui décrit les étapes pour déployer un cluster Kubernetes sur des hôtes Debian.
### Voici un aperçu de ce que fait chaque tâche :
	"Installer les paquets requis" : Cette tâche utilise le module apt d'Ansible pour installer plusieurs packages nécessaires, comme Docker et certains outils de réseau, sur la machine Debian.
	"Configurer le référentiel Docker" : Cette tâche ajoute une clé GPG à partir d'une URL pour permettre à apt de vérifier l'intégrité des packages téléchargés depuis ce référentiel.
	"Ajouter le dépôt apt de Docker" : Cette tâche ajoute une entrée au fichier des sources de package apt pour le référentiel Docker.
	"Ajouter la clé GPG de Kubernetes" : Cette tâche ajoute une clé GPG à partir d'une URL pour permettre à apt de vérifier l'intégrité des packages téléchargés à partir du référentiel de Kubernetes.
	"Installer Kubernetes" : Cette tâche ajoute une entrée au fichier des sources de package apt pour le référentiel de Kubernetes.
	"Installer les composants Kubernetes" : Cette tâche utilise le module apt d'Ansible pour installer lelet, kubeadm et kubectl de Kubernetes sur la machine Debian.
	"Initialiser le nœud maître Kubernetes" : Cette tâche utilise le module command d'Ansible pour exécuter la commande kubeadm init, qui initialise un nouveau cluster Kubernetes. Celle-ci est exécutée seulement sur le nœud maître.
	"Créer le répertoire kube" : Cette tâche crée un répertoire .kube dans le dossier utilisateur du nœud maître.
	"Copier le kubeconfig" : Cette tâche copie le fichier de configuration de Kubernetes du dossier /etc/kubernetes au dossier .kube précédemment créé.
	"Installer le plugin réseau (exemple avec flannel)" : Cette tâche installe Flannel, un plugin de réseau pour Kubernetes, sur le cluster.
	"Extraire la commande kubeadm join" : Cette tâche capture la sortie de la commande kubeadm init (qui contient une commande kubeadm join que les nœuds ouvriers peuvent utiliser pour rejoindre le cluster) dans une variable pour une utilisation ultérieure.
	"Récupérer la commande kubeadm join du groupe Master" : Cette tâche récupère la commande kubeadm join précédemment enregistrée du nœud maître.
	"Joindre les nœuds ouvriers au cluster" : Cette tâche exécute la commande kubeadm join sur tous les nœuds ouvriers, leur permettant de rejoindre le cluster.
	Note : Les tâches qui ont la condition when: ansible_os_family == 'Debian' ne seront exécutées que sur les hôtes qui sont identifiés comme ayant une famille d'OS Debian, tandis que les tâches qui ont la condition when: "'Master' in group_names" ne seront exécutées que sur les hôtes qui sont dans le groupe Master. De même, la tâche finale ne sera exécutée que sur les hôtes du groupe Worker.
