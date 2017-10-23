<?php

namespace ORM\Builders\Traits;

trait GroupBy {

	private $groups;

	public function groupBy(...$groups) {
		$this->groups = $groups;

		return $this;
	}

	private function resolveGroupBy() {
		$resolved = [];
		$sql = '';

		if (!empty($this->groups)) {
			$sql = "\n\t" . ' GROUP BY ';
		}

		foreach ($this->groups as $property) {
			list($prop) = $this->processProperty($property);
			array_push($resolved, $prop);
			array_push($this->columns, $prop);
		}


		return $sql . join(', ', $resolved);
	}

}
